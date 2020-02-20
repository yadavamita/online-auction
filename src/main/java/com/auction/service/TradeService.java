package com.auction.service;

import com.auction.model.Trade;

import java.util.List;

public interface TradeService {
    public void saveTrade(Trade trade);
    public List<Trade> getTrades();
    public void deleteTrade(String name);
    public Trade findTradeByName(String name);
}
