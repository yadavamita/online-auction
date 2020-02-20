package com.auction.dao;

import com.auction.model.Trade;

import java.util.List;

public interface TradeDAO {
    public void saveTrade(Trade trade);
    public List<Trade> getTrades();
    public void deleteTrade(Trade trade);
    public Trade findTradeByName(String name);
}
