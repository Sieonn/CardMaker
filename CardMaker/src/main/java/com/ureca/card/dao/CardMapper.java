package com.ureca.card.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ureca.card.dto.Card;

@Mapper
public interface CardMapper {
	List<Card> selectAllCards();
	Card selectCardById(@Param("id") Long id);
	void insertCard(Card card);
	void updateCard(Card card);
	void deleteCard(@Param("id") Long id);
}
