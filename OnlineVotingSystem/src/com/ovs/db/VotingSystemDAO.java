package com.ovs.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.ovs.model.Candidate;
import com.ovs.model.Election;
import com.ovs.model.Voter;

import oracle.sql.DATE;

public class VotingSystemDAO {
	
	private Connection conn = null;
	private PreparedStatement ps = null; 
	private ResultSet rs = null;
	
	public int addVoter(Voter voter) throws SQLException {
		
		String sql = "insert into Voter(NAME,AGE,CONSTITUENCY,SSN, MOBILENUMBER,USERNAME,PASSWORD,VOTED,ISCANDIDATE,EMAIL,SEX) values ('"+voter.getName()+"','"+voter.getAge()+"','"+voter.getConstituency()+"','"+voter.getSsn()+"','"+voter.getMobnum()+"','"+voter.getUname()+"','"+voter.getPwd()+"','0','0','"+voter.getEmail()+"','"+voter.getSex()+"');";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public int addCandidate(Candidate candidate)throws SQLException {
		
		String sql = "insert into Candidate(NAME,VoterID,Constituency,Age,ElectionID,ElectionName,ISAPPROVED,PARTY_NAME) values ('"+candidate.getName()+"','"+candidate.getVid()+"','"+candidate.getConstituency()+"','"+candidate.getAge()+"','"+candidate.getElectionId()+"','"+candidate.getElectionName()+"','0','"+candidate.getPartyName()+"');";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}

	public Voter getVoter(String vID)throws SQLException {
		
		String sql = "select * from Voter where ID='"+vID+"';";
		Voter voter = new Voter();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {
			voter.setId(rs.getString("ID"));
			voter.setName(rs.getString("NAME"));
			voter.setSsn(rs.getString("SSN"));
			voter.setAge(rs.getInt("AGE"));
			voter.setSex(rs.getString("SEX"));
			voter.setConstituency(rs.getString("CONSTITUENCY"));
			voter.setVoted(rs.getBoolean("VOTED"));
			voter.setCandidate(rs.getBoolean("ISCANDIDATE"));
			voter.setMobnum(rs.getLong("MOBILENUMBER"));
			voter.setEmail(rs.getString("EMAIL"));
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return voter;
	}
	
	public Candidate getCandidate(String vID)throws SQLException {
		
		String sql = "select * from CANDIDATE where CANDIDATE.VOTERID='"+vID+"';";
		Candidate candidate = new Candidate();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {
			candidate.setCid(rs.getString("ID"));
			candidate.setName(rs.getString("NAME"));
			candidate.setElectionId(rs.getString("ELECTIONID"));
			candidate.setAge(rs.getInt("AGE"));
			candidate.setElectionName(rs.getString("ELECTIONNAME"));
			candidate.setVid(rs.getString("VOTERID"));
			candidate.setConstituency(rs.getString("CONSTITUENCY"));
			candidate.setApproved(rs.getBoolean("ISAPPROVED"));
			candidate.setPartyName(rs.getString("PARTY_NAME"));
		}}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return candidate;
	}
	
	public int approveCandidate(String CandidateID) throws SQLException {
		
		String sql = "update CANDIDATE set CANDIDATE.ISAPPROVED='1' where CANDIDATE.ID='"+CandidateID+"'";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public int addElection(Election election) throws SQLException{
		int i=0 ;
		String sql = "insert into ELECTION(NAME,CONSTITUENCY,DATE,NOMINATIONDATE,ACTIVE) values ('"+election.getName()+"','"+election.getConstituency()+"','"+election.getDate()+"','"+election.getNdate()+"','0')";
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
	
	public List<Election> getAllElections(){
		String sql = "select * from ELECTION";
		List<Election> elist = new ArrayList<Election>();
		try {
		conn = DBConnector.getConnection();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Election election = new Election();
			election.setId(rs.getString("ID"));
			election.setName(rs.getString("NAME"));
			election.setConstituency(rs.getString("CONSTITUENCY"));
			election.setDate(rs.getString("DATE"));
			election.setNdate(rs.getString("NOMINATIONDATE"));
			election.setIsActive(rs.getBoolean("ACTIVE"));
			election.setWinner(rs.getInt("WINNER"));
			elist.add(election);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return elist;
	}
	
	public List<Candidate> getAllCandidates(String eID) throws SQLException{
		String sql = "select * from CANDIDATE WHERE ELECTIONID='"+eID+"' AND ISAPPROVED = TRUE";
		List<Candidate> clist = new ArrayList<Candidate>();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {
			Candidate candidate = new Candidate();
			candidate.setCid(rs.getString("ID"));
			candidate.setName(rs.getString("NAME"));
			candidate.setElectionId(rs.getString("ELECTIONID"));
			candidate.setAge(rs.getInt("AGE"));
			candidate.setElectionName(rs.getString("ELECTIONNAME"));
			candidate.setVid(rs.getString("VOTERID"));
			candidate.setConstituency(rs.getString("CONSTITUENCY"));
			candidate.setApproved(rs.getBoolean("ISAPPROVED"));
			candidate.setPartyName(rs.getString("PARTY_NAME"));
			clist.add(candidate);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return clist;
	}
	
	public List<Candidate> getAllCandidates(){
		String sql = "select * from CANDIDATE WHERE ISAPPROVED = FALSE AND ISREJECTED != TRUE";
		List<Candidate> clist = new ArrayList<Candidate>();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {
			Candidate candidate = new Candidate();
			candidate.setCid(rs.getString("ID"));
			candidate.setName(rs.getString("NAME"));
			candidate.setElectionId(rs.getString("ELECTIONID"));
			candidate.setAge(rs.getInt("AGE"));
			candidate.setElectionName(rs.getString("ELECTIONNAME"));
			candidate.setVid(rs.getString("VOTERID"));
			candidate.setConstituency(rs.getString("CONSTITUENCY"));
			candidate.setApproved(rs.getBoolean("ISAPPROVED"));
			candidate.setPartyName(rs.getString("PARTY_NAME"));
			clist.add(candidate);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return clist;
	}
	
	public Voter verifyUser(String uname,String pwd) throws SQLException {
		System.out.println(uname+pwd);
		String sql = "Select * from Voter where USERNAME='"+uname+"' and PASSWORD='"+pwd+"'";
		Voter voter = new Voter();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {
			voter.setId(rs.getString("ID"));
			voter.setName(rs.getString("NAME"));
			voter.setSsn(rs.getString("SSN"));
			voter.setAge(rs.getInt("AGE"));
			voter.setConstituency(rs.getString("CONSTITUENCY"));
			voter.setVoted(rs.getBoolean("VOTED"));
			voter.setCandidate(rs.getBoolean("ISCANDIDATE"));
			voter.setEmail(rs.getString("EMAIL"));
			voter.setSex(rs.getString("SEX"));
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return voter;
	}
	
	public int vote1(String eID,String cID) throws SQLException {
		String sql= "UPDATE candidate SET vote= vote+1 WHERE id='"+cID+"' AND electionid='"+eID+"'";
		int i = 0;
		try {
			conn = DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
	return i;
	}
	
	public int vote2(String vID) throws SQLException {
		String sql= "UPDATE voter SET voted=TRUE WHERE id='"+vID+"' and voted='0'";
		int i = 0;
		try {
			conn = DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
	return i;
	}
	
	public List<Candidate> announceResult(String eID,String user) throws SQLException{
		String sql;
		if(user.equals("admin")) {
		sql ="SELECT * FROM CANDIDATE WHERE VOTE IN (SELECT MAX(VOTE) FROM CANDIDATE WHERE VOTE<>0 AND ELECTIONID ='"+eID+"' AND ISAPPROVED=TRUE)";
		}else {
		 sql ="SELECT * FROM CANDIDATE WHERE VOTE IN (SELECT MAX(VOTE) FROM CANDIDATE WHERE VOTE<>0 AND ISAPPROVED=TRUE)";	
		}
		List<Candidate> clist = new ArrayList<Candidate>();
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		while(rs.next()) {	
			Candidate candidate = new Candidate();
			candidate.setCid(rs.getString("ID"));
			candidate.setName(rs.getString("NAME"));
			candidate.setElectionId(rs.getString("ELECTIONID"));
			candidate.setAge(rs.getInt("AGE"));
			candidate.setElectionName(rs.getString("ELECTIONNAME"));
			candidate.setPartyName(rs.getString("PARTY_NAME"));
			candidate.setConstituency(rs.getString("CONSTITUENCY"));
			candidate.setApproved(rs.getBoolean("ISAPPROVED"));
			candidate.setPartyName(rs.getString("PARTY_NAME"));
			candidate.setVote(rs.getInt("VOTE"));
			clist.add(candidate);
		}}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return clist;
	}
	
	public int activateElection(String eid) {
		String sql = "UPDATE ELECTION SET ACTIVE='1' WHERE ID='"+eid+"' AND ACTIVE='0'";
		int i=0;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return i;
	}
	
	public int updateElection(String eID,String cID) throws SQLException {
		String sql ="UPDATE ELECTION SET WINNER='"+cID+"',ACTIVE='-1' WHERE ID='"+eID+"'";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return i;
		}

	public int updateIsCandidateVoter(String vID) {
		String sql = "UPDATE VOTER SET ISCANDIDATE='1' WHERE ID='"+vID+"' AND ISCANDIDATE='0'";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return i;
	}

	public int updatePwd(String uname, String pwd) {
		// TODO Auto-generated method stub
		String sql = "update voter set password='"+pwd+"' where USERNAME='"+uname+"'";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return i;
	}

	public int updateVoter(Voter voter, String vid) {
		// TODO Auto-generated method stub
		String sql = "update voter set name='"+voter.getName()+"',age='"+voter.getAge()+"',ssn='"+voter.getSsn()+"',constituency='"+voter.getConstituency()+"',mobilenumber='"+voter.getMobnum()+"',username='"+voter.getUname()+"',password='"+voter.getPwd()+"',email='"+voter.getEmail()+"',sex='"+voter.getSex()+"' where ID='"+vid+"'";
		System.out.println(sql);
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
		e.printStackTrace();
	}finally {
	DBConnector.closeStatement(ps);
	DBConnector.closeConnection(conn);
	}
		return i;
	}

	public int rejectCandidate(String cID) {
		// TODO Auto-generated method stub
		String sql = "update CANDIDATE set CANDIDATE.ISREJECTED='1' where CANDIDATE.ID='"+cID+"'";
		int i =0 ;
		try {
			conn = DBConnector.getConnection();
			ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		DBConnector.closeStatement(ps);
		DBConnector.closeConnection(conn);
		}
		return i;
	}
}
