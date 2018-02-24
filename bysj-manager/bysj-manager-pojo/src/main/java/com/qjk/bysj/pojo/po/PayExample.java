package com.qjk.bysj.pojo.po;

import java.util.ArrayList;
import java.util.List;

public class PayExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PayExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPidIsNull() {
            addCriterion("pid is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("pid is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Long value) {
            addCriterion("pid =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Long value) {
            addCriterion("pid <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Long value) {
            addCriterion("pid >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Long value) {
            addCriterion("pid >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Long value) {
            addCriterion("pid <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Long value) {
            addCriterion("pid <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Long> values) {
            addCriterion("pid in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Long> values) {
            addCriterion("pid not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Long value1, Long value2) {
            addCriterion("pid between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Long value1, Long value2) {
            addCriterion("pid not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andSidIsNull() {
            addCriterion("sid is null");
            return (Criteria) this;
        }

        public Criteria andSidIsNotNull() {
            addCriterion("sid is not null");
            return (Criteria) this;
        }

        public Criteria andSidEqualTo(Long value) {
            addCriterion("sid =", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotEqualTo(Long value) {
            addCriterion("sid <>", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidGreaterThan(Long value) {
            addCriterion("sid >", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidGreaterThanOrEqualTo(Long value) {
            addCriterion("sid >=", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidLessThan(Long value) {
            addCriterion("sid <", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidLessThanOrEqualTo(Long value) {
            addCriterion("sid <=", value, "sid");
            return (Criteria) this;
        }

        public Criteria andSidIn(List<Long> values) {
            addCriterion("sid in", values, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotIn(List<Long> values) {
            addCriterion("sid not in", values, "sid");
            return (Criteria) this;
        }

        public Criteria andSidBetween(Long value1, Long value2) {
            addCriterion("sid between", value1, value2, "sid");
            return (Criteria) this;
        }

        public Criteria andSidNotBetween(Long value1, Long value2) {
            addCriterion("sid not between", value1, value2, "sid");
            return (Criteria) this;
        }

        public Criteria andBasicIsNull() {
            addCriterion("basic is null");
            return (Criteria) this;
        }

        public Criteria andBasicIsNotNull() {
            addCriterion("basic is not null");
            return (Criteria) this;
        }

        public Criteria andBasicEqualTo(Float value) {
            addCriterion("basic =", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicNotEqualTo(Float value) {
            addCriterion("basic <>", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicGreaterThan(Float value) {
            addCriterion("basic >", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicGreaterThanOrEqualTo(Float value) {
            addCriterion("basic >=", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicLessThan(Float value) {
            addCriterion("basic <", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicLessThanOrEqualTo(Float value) {
            addCriterion("basic <=", value, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicIn(List<Float> values) {
            addCriterion("basic in", values, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicNotIn(List<Float> values) {
            addCriterion("basic not in", values, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicBetween(Float value1, Float value2) {
            addCriterion("basic between", value1, value2, "basic");
            return (Criteria) this;
        }

        public Criteria andBasicNotBetween(Float value1, Float value2) {
            addCriterion("basic not between", value1, value2, "basic");
            return (Criteria) this;
        }

        public Criteria andEatIsNull() {
            addCriterion("eat is null");
            return (Criteria) this;
        }

        public Criteria andEatIsNotNull() {
            addCriterion("eat is not null");
            return (Criteria) this;
        }

        public Criteria andEatEqualTo(Float value) {
            addCriterion("eat =", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatNotEqualTo(Float value) {
            addCriterion("eat <>", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatGreaterThan(Float value) {
            addCriterion("eat >", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatGreaterThanOrEqualTo(Float value) {
            addCriterion("eat >=", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatLessThan(Float value) {
            addCriterion("eat <", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatLessThanOrEqualTo(Float value) {
            addCriterion("eat <=", value, "eat");
            return (Criteria) this;
        }

        public Criteria andEatIn(List<Float> values) {
            addCriterion("eat in", values, "eat");
            return (Criteria) this;
        }

        public Criteria andEatNotIn(List<Float> values) {
            addCriterion("eat not in", values, "eat");
            return (Criteria) this;
        }

        public Criteria andEatBetween(Float value1, Float value2) {
            addCriterion("eat between", value1, value2, "eat");
            return (Criteria) this;
        }

        public Criteria andEatNotBetween(Float value1, Float value2) {
            addCriterion("eat not between", value1, value2, "eat");
            return (Criteria) this;
        }

        public Criteria andHouseIsNull() {
            addCriterion("house is null");
            return (Criteria) this;
        }

        public Criteria andHouseIsNotNull() {
            addCriterion("house is not null");
            return (Criteria) this;
        }

        public Criteria andHouseEqualTo(Float value) {
            addCriterion("house =", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseNotEqualTo(Float value) {
            addCriterion("house <>", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseGreaterThan(Float value) {
            addCriterion("house >", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseGreaterThanOrEqualTo(Float value) {
            addCriterion("house >=", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseLessThan(Float value) {
            addCriterion("house <", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseLessThanOrEqualTo(Float value) {
            addCriterion("house <=", value, "house");
            return (Criteria) this;
        }

        public Criteria andHouseIn(List<Float> values) {
            addCriterion("house in", values, "house");
            return (Criteria) this;
        }

        public Criteria andHouseNotIn(List<Float> values) {
            addCriterion("house not in", values, "house");
            return (Criteria) this;
        }

        public Criteria andHouseBetween(Float value1, Float value2) {
            addCriterion("house between", value1, value2, "house");
            return (Criteria) this;
        }

        public Criteria andHouseNotBetween(Float value1, Float value2) {
            addCriterion("house not between", value1, value2, "house");
            return (Criteria) this;
        }

        public Criteria andOtherIsNull() {
            addCriterion("other is null");
            return (Criteria) this;
        }

        public Criteria andOtherIsNotNull() {
            addCriterion("other is not null");
            return (Criteria) this;
        }

        public Criteria andOtherEqualTo(Float value) {
            addCriterion("other =", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherNotEqualTo(Float value) {
            addCriterion("other <>", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherGreaterThan(Float value) {
            addCriterion("other >", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherGreaterThanOrEqualTo(Float value) {
            addCriterion("other >=", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherLessThan(Float value) {
            addCriterion("other <", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherLessThanOrEqualTo(Float value) {
            addCriterion("other <=", value, "other");
            return (Criteria) this;
        }

        public Criteria andOtherIn(List<Float> values) {
            addCriterion("other in", values, "other");
            return (Criteria) this;
        }

        public Criteria andOtherNotIn(List<Float> values) {
            addCriterion("other not in", values, "other");
            return (Criteria) this;
        }

        public Criteria andOtherBetween(Float value1, Float value2) {
            addCriterion("other between", value1, value2, "other");
            return (Criteria) this;
        }

        public Criteria andOtherNotBetween(Float value1, Float value2) {
            addCriterion("other not between", value1, value2, "other");
            return (Criteria) this;
        }

        public Criteria andBonusIsNull() {
            addCriterion("bonus is null");
            return (Criteria) this;
        }

        public Criteria andBonusIsNotNull() {
            addCriterion("bonus is not null");
            return (Criteria) this;
        }

        public Criteria andBonusEqualTo(Float value) {
            addCriterion("bonus =", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusNotEqualTo(Float value) {
            addCriterion("bonus <>", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusGreaterThan(Float value) {
            addCriterion("bonus >", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusGreaterThanOrEqualTo(Float value) {
            addCriterion("bonus >=", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusLessThan(Float value) {
            addCriterion("bonus <", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusLessThanOrEqualTo(Float value) {
            addCriterion("bonus <=", value, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusIn(List<Float> values) {
            addCriterion("bonus in", values, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusNotIn(List<Float> values) {
            addCriterion("bonus not in", values, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusBetween(Float value1, Float value2) {
            addCriterion("bonus between", value1, value2, "bonus");
            return (Criteria) this;
        }

        public Criteria andBonusNotBetween(Float value1, Float value2) {
            addCriterion("bonus not between", value1, value2, "bonus");
            return (Criteria) this;
        }

        public Criteria andPenaltyIsNull() {
            addCriterion("penalty is null");
            return (Criteria) this;
        }

        public Criteria andPenaltyIsNotNull() {
            addCriterion("penalty is not null");
            return (Criteria) this;
        }

        public Criteria andPenaltyEqualTo(Float value) {
            addCriterion("penalty =", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyNotEqualTo(Float value) {
            addCriterion("penalty <>", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyGreaterThan(Float value) {
            addCriterion("penalty >", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyGreaterThanOrEqualTo(Float value) {
            addCriterion("penalty >=", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyLessThan(Float value) {
            addCriterion("penalty <", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyLessThanOrEqualTo(Float value) {
            addCriterion("penalty <=", value, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyIn(List<Float> values) {
            addCriterion("penalty in", values, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyNotIn(List<Float> values) {
            addCriterion("penalty not in", values, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyBetween(Float value1, Float value2) {
            addCriterion("penalty between", value1, value2, "penalty");
            return (Criteria) this;
        }

        public Criteria andPenaltyNotBetween(Float value1, Float value2) {
            addCriterion("penalty not between", value1, value2, "penalty");
            return (Criteria) this;
        }

        public Criteria andScotIsNull() {
            addCriterion("scot is null");
            return (Criteria) this;
        }

        public Criteria andScotIsNotNull() {
            addCriterion("scot is not null");
            return (Criteria) this;
        }

        public Criteria andScotEqualTo(Float value) {
            addCriterion("scot =", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotNotEqualTo(Float value) {
            addCriterion("scot <>", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotGreaterThan(Float value) {
            addCriterion("scot >", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotGreaterThanOrEqualTo(Float value) {
            addCriterion("scot >=", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotLessThan(Float value) {
            addCriterion("scot <", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotLessThanOrEqualTo(Float value) {
            addCriterion("scot <=", value, "scot");
            return (Criteria) this;
        }

        public Criteria andScotIn(List<Float> values) {
            addCriterion("scot in", values, "scot");
            return (Criteria) this;
        }

        public Criteria andScotNotIn(List<Float> values) {
            addCriterion("scot not in", values, "scot");
            return (Criteria) this;
        }

        public Criteria andScotBetween(Float value1, Float value2) {
            addCriterion("scot between", value1, value2, "scot");
            return (Criteria) this;
        }

        public Criteria andScotNotBetween(Float value1, Float value2) {
            addCriterion("scot not between", value1, value2, "scot");
            return (Criteria) this;
        }

        public Criteria andTotalIsNull() {
            addCriterion("total is null");
            return (Criteria) this;
        }

        public Criteria andTotalIsNotNull() {
            addCriterion("total is not null");
            return (Criteria) this;
        }

        public Criteria andTotalEqualTo(Float value) {
            addCriterion("total =", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotEqualTo(Float value) {
            addCriterion("total <>", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalGreaterThan(Float value) {
            addCriterion("total >", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalGreaterThanOrEqualTo(Float value) {
            addCriterion("total >=", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalLessThan(Float value) {
            addCriterion("total <", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalLessThanOrEqualTo(Float value) {
            addCriterion("total <=", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalIn(List<Float> values) {
            addCriterion("total in", values, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotIn(List<Float> values) {
            addCriterion("total not in", values, "total");
            return (Criteria) this;
        }

        public Criteria andTotalBetween(Float value1, Float value2) {
            addCriterion("total between", value1, value2, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotBetween(Float value1, Float value2) {
            addCriterion("total not between", value1, value2, "total");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}