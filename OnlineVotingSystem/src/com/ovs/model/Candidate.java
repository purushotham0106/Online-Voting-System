package com.ovs.model;

public class Candidate {
	
	private String cid;
	private String vid;
	private String name;
	private String address;
	private int age;
	private String electionId;
	private String electionName;
	private String constituency;
	private boolean isApproved;
	private String partyName;
	private int vote;
	
	
	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}


	
	public Candidate(String vid, String name, int age, String electionId, String electionName, String constituency, String partyName) {
		super();
		this.vid = vid;
		this.name = name;
		this.age = age;
		this.electionId = electionId;
		this.electionName = electionName;
		this.constituency = constituency;
		this.isApproved = false;
		this.partyName = partyName;
	}

	public Candidate() {
		// TODO Auto-generated constructor stub
		this.isApproved = false;
	}
		
	public boolean isApproved() {
		return isApproved;
	}

	public void setApproved(boolean isApproved) {
		this.isApproved = isApproved;
	}

	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getElectionId() {
		return electionId;
	}
	public void setElectionId(String electionId) {
		this.electionId = electionId;
	}
	public String getElectionName() {
		return electionName;
	}
	public void setElectionName(String electionName) {
		this.electionName = electionName;
	}
	public String getConstituency() {
		return constituency;
	}
	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}
	
	
}
