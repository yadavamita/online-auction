package com.auction.dao;

import com.auction.model.Trade;
import com.auction.model.User;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tradeDAO")
public class TradeDAOImpl implements TradeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveTrade(Trade trade) {
        getSession().save(trade);
    }

    @Override
    public List<Trade> getTrades() {
        Criteria criteria = getSession().createCriteria(Trade.class);
        return (List) criteria.list();
    }

    @Override
    public void deleteTrade(Trade trade) {
        getSession().delete(trade);
    }

    @Override
    public Trade findTradeByName(String name) {
        Criteria criteria = getSession().createCriteria(Trade.class);
        Object obj = criteria.add(Restrictions.eq("name", name)).uniqueResult();
        return (Trade) obj;
    }
}
