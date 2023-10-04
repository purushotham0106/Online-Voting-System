package com.ovs.model;

public class Voter {

	private String id;
	private String name;
	private String constituency;
	private int age;
	private String sex;
	private boolean voted;
	private boolean isCandidate;
	private String ssn;
	private String uname;
	private String pwd;
	private long mobnum;
	private String email;
		
	public Voter(String name, String constituency, int age, String ssn, String uname,String pwd,long mobnum, String email,String sex) {
		super();
		this.name = name;
		this.constituency = constituency;
		this.age = age;
		this.ssn = ssn;
		this.isCandidate = false;
		this.voted = false;
		this.uname = uname;
		this.pwd = pwd;
		this.mobnum = mobnum;
		this.email = email;
		this.sex = sex;
	}
	
	
	public Voter() {
		// TODO Auto-generated constructor stub
		this.isCandidate = false;
		this.voted = false;
	}
	
	
	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public long getMobnum() {
		return mobnum;
	}

	public void setMobnum(long mobnum) {
		this.mobnum = mobnum;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public boolean isCandidate() {
		return isCandidate;
	}


	public void setCandidate(boolean isCandidate) {
		this.isCandidate = isCandidate;
	}


	public String getSsn() {
		return ssn;
	}


	public void setSsn(String ssn) {
		this.ssn = ssn;
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

	public String getConstituency() {
		return constituency;
	}

	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isVoted() {
		return voted;
	}

	public void setVoted(boolean voted) {
		this.voted = voted;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
