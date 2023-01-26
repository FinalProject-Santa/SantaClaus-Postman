package com.boot.jdbc.model.dto;

public class PageMaker {
	 	private Criteria cri;
	 	private Criteria_Letter cri_letter;
	    private int totalCount;
	    private int startPage;
	    private int endPage;
	    private boolean prev;
	    private boolean next;
	    private int displayPageNum = 5;
	    
	    public Criteria getCri() {
	        return cri;
	    }
	    public Criteria_Letter getCriLetter() {
	        return cri_letter;
	    }
	    public void setCri(Criteria cri) {
	        this.cri = cri;
	    }
	    public void setCriLetter(Criteria_Letter cri_letter) {
	        this.cri_letter = cri_letter;
	    }
	    public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcData();
	    }
	    public void setTotalLetterCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcLetterData();
	    }
	    
	    private void calcData() {
	        
	        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
	 
	        startPage = (endPage - displayPageNum) + 1;
	        if(startPage <= 0) startPage = 1;
	        
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	 
	        prev = startPage == 1 ? false : true;
	        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
	        
	    }
	    
	    private void calcLetterData() {
	        
	        endPage = (int) (Math.ceil(cri_letter.getPage() / (double) displayPageNum) * displayPageNum);
	 
	        startPage = (endPage - displayPageNum) + 1;
	        if(startPage <= 0) startPage = 1;
	        
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri_letter.getPerPageNum()));
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	 
	        prev = startPage == 1 ? false : true;
	        next = endPage * cri_letter.getPerPageNum() < totalCount ? true : false;
	        
	    }
	    
	    public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }
}
