package com.ureca.card.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ureca.card.dto.Card;
import com.ureca.card.service.CardService;

@Controller
@RequestMapping("/card")
public class CardController {
	@Autowired
	private CardService cardService;

    // 실제 파일 저장 경로 (절대 경로로 지정해야 합니다)
    private final String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/uploads/";

    @GetMapping("/form")
    public String form(@RequestParam(value = "writer", required = false) String writer, Model model) {
        model.addAttribute("writer", writer);
        return "form";
    }

    @PostMapping("/save")
    public String saveCard(@RequestParam("title") String title,
                           @RequestParam("content") String content,
                           @RequestParam("writer") String writer,
                           @RequestParam("file") MultipartFile file,
                           Model model) {
        Card card = new Card();
        card.setTitle(title);
        card.setContent(content);
        card.setWriter(writer);

        if (!file.isEmpty()) {
            try {
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                String fileName = file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                file.transferTo(filePath.toFile());

                // 웹에서 접근 가능한 경로로 설정 (WebConfig에서 정의한 가상 경로)
                card.setImagePath("/uploads/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        cardService.insertCard(card);
        return "redirect:/card/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("cards", cardService.selectAllCards());
        return "list";
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model) {
        Card card = cardService.selectCardById(id);
        model.addAttribute("card", card);
        return "detail";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        Card card = cardService.selectCardById(id);
        model.addAttribute("card", card);
        return "edit"; // editForm.jsp 페이지를 사용하여 수정 폼 제공
    }

    @PostMapping("/update")
    public String updateCard(@RequestParam("id") Long id,
                             @RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("writer") String writer,
                             @RequestParam("file") MultipartFile file,
                             Model model) {
        // 기존 카드를 DB에서 가져오기
        Card card = cardService.selectCardById(id);
        card.setTitle(title);
        card.setContent(content);
        card.setWriter(writer);
        try {
            if (!file.isEmpty()) {
                // 업로드 디렉토리 설정
                String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/uploads/";
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String fileName = file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                file.transferTo(filePath.toFile());

                // 새 이미지 경로 설정
                card.setImagePath("/uploads/" + fileName);
            }
            // 파일이 비어있으면 기존 이미지 경로를 그대로 유지
        } catch (IOException e) {
            e.printStackTrace();
            // 오류 처리 로직 추가
        }

        // 카드 업데이트 로직
        cardService.updateCard(card);
        return "redirect:/card/list";
    }

    @PostMapping("/delete")
    public String deleteCard(@RequestParam("id") Long id) {
        cardService.deleteCard(id);
        return "redirect:/card/list";
    }
}
