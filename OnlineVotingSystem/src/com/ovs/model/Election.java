package com.ovs.model;

import java.util.List;

public class Election {
	
	private String id;
	private String name;
	private String date;
	private String ndate;
	private List<Candidate> candidates;
	private String result;
	private int winner;
	private String constituency;
	private boolean isActive;
	
	public Election() {}
	
	public Election(String name, String constituency, String date1, String date2) {
		super();
		this.name = name;
		this.constituency = constituency;
		this.date = date1;
		this.ndate = date2;
	}
	
	public Election(String id, String name, List<Candidate> candidates) {
		super();
		this.id = id;
		this.name = name;
		this.candidates = candidates;
	}
	
	
	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Candidate> getCandidates() {
		return candidates;
	}

	public void setCandidates(List<Candidate> candidates) {
		this.candidates = candidates;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getWinner() {
		return winner;
	}

	public void setWinner(int winner) {
		this.winner = winner;
	}

	public String getConstituency() {
		return constituency;
	}

	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}

	public void setDate(String date) {
		// TODO Auto-generated method stub
		this.date = date;
	}
	
	public String getDate() {
		return date;
	}

	public void setIsActive(boolean b) {
		// TODO Auto-generated method stub
		this.isActive = b;
	}
	
	public boolean getIsActive() {
		return isActive;
	}

	
}
