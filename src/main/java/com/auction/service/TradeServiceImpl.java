package com.auction.service;

import com.auction.dao.TradeDAO;
import com.auction.model.Trade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;

@Service
public class TradeServiceImpl implements TradeService {

    @Autowired
    private TradeDAO tradeDAO;

    @Override
    @Transactional
    public void saveTrade(Trade trade) {
        this.tradeDAO.saveTrade(trade);
    }

    @Override
    @Transactional
    public List<Trade> getTrades() {
        List<Trade> tradeList =this.tradeDAO.getTrades();
        tradeList.sort(Comparator.comparingDouble(Trade::getPrice).reversed());
        return tradeList;
    }

    @Override
    @Transactional
    public void deleteTrade(String name) {
        Trade trade = this.tradeDAO.findTradeByName(name);
        this.tradeDAO.deleteTrade(trade);
    }

    @Override
    @Transactional
    public Trade findTradeByName(String name) {
        Trade trade =this.tradeDAO.findTradeByName(name);
        return trade;
    }
}
