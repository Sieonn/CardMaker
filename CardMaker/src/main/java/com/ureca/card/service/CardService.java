package com.ureca.card.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.card.dao.CardMapper;
import com.ureca.card.dto.Card;

@Service
public class CardService {
	@Autowired
	private CardMapper cardMapper;

	public void insertCard(Card card) {
        cardMapper.insertCard(card);
    }

    public List<Card> selectAllCards() {
        return cardMapper.selectAllCards();
    }

    public Card selectCardById(Long id) {
        return cardMapper.selectCardById(id);
    }

    public void deleteCard(Long id) {
        cardMapper.deleteCard(id);
    }

    public void updateCard(Card card) {
        cardMapper.updateCard(card);
    }
}
