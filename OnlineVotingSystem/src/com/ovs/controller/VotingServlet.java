package com.ovs.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import com.ovs.db.VotingSystemDAO;
import com.ovs.model.Candidate;
import com.ovs.model.Election;
import com.ovs.model.Voter;

/**
 * Servlet implementation class VotingServlet
 */
//@WebServlet("/VotingServlet")
public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int c=0;
    /**
     * Default constructor. 
     */
    public VotingServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parameter = req.getParameter("parameter");
		System.out.println(parameter);
        ServletContext ctx= getServletContext();
        VotingSystemDAO dao = new VotingSystemDAO();
		if(parameter.equals("login")) {
			if(req.getParameter("username").equals("admin") && req.getParameter("password").equals("admin")) {
					HttpSession session = req.getSession(true);
					session.setMaxInactiveInterval(30000);
					session.setAttribute("User", "Admin"); 
			      //  c=(Integer)ctx.getAttribute("currentusers");
			     //   System.out.println(c);
			        ArrayList<Election> ealist = (ArrayList<Election>) dao.getAllElections();
			        ArrayList<Election> evlist = new ArrayList<Election>();
			        ArrayList<Election> eilist = new ArrayList<Election>();
			        ealist.forEach(election ->{ 
						if(election.getIsActive()){
							evlist.add(election);
						}else {
							eilist.add(election);
						}
						});
					ArrayList<Candidate> clist = (ArrayList<Candidate>) dao.getAllCandidates();
					if(clist.size()==0 || ealist.size()==0) {
						System.out.println("NULL**********************");
					}
					req.setAttribute("elist", evlist);
					req.setAttribute("eilist", eilist);
					req.setAttribute("clist", clist);
			       // if(c==1) {
					RequestDispatcher rd = req.getRequestDispatcher("/AdminHome.jsp");
					rd.forward(req, rsp);
			    //    }
				}else {
					req.setAttribute("msg", "Invalid Credentials.");
					RequestDispatcher rd = req.getRequestDispatcher("/A_Login.jsp");
					rd.forward(req, rsp);
				}
			}else if(parameter.equals("vlogin")){
				try {
					Voter voter = dao.verifyUser(req.getParameter("username"), req.getParameter("password"));
					
					ArrayList<Election> ealist = (ArrayList<Election>) dao.getAllElections();
					ArrayList<Election> evlist = new ArrayList<Election>();
					ArrayList<Election> eilist = new ArrayList<Election>();
					ealist.forEach(election ->{ 
						if(election.getConstituency().equals(voter.getConstituency()) && election.getWinner()==0){
							if(election.getIsActive()) {
								evlist.add(election);
								}else{
									eilist.add(election);
									}
						}
						});
					if(voter.getName()!=null) {
						HttpSession session = req.getSession(true);
						session.setMaxInactiveInterval(30000);
						req.setAttribute("User", "Voter");
						req.setAttribute("elist", evlist);
						req.setAttribute("eilist", eilist);
						req.setAttribute("vid",voter.getId());
						req.setAttribute("Name", voter.getName());
						req.setAttribute("Voted", voter.isVoted());
						req.setAttribute("isCandidate", voter.isCandidate());
					  //  c=(Integer)ctx.getAttribute("currentusers");
					   // if(c==1) {
						RequestDispatcher rd = req.getRequestDispatcher("/VoterHome.jsp");
						rd.forward(req, rsp);
					   //     }
					}else {
						req.setAttribute("msg", "Invalid Credentials.");
						RequestDispatcher rd = req.getRequestDispatcher("/Login.jsp");
						rd.forward(req, rsp);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(parameter.equals("addVoter")) {
			
			Voter voter = new Voter(req.getParameter("vname"),req.getParameter("constituency"),Integer.parseInt(req.getParameter("age")),req.getParameter("ssn"),req.getParameter("uname"),req.getParameter("pwd"),Long.parseLong(req.getParameter("num")),req.getParameter("email"),req.getParameter("sex"));
			
				int i = 0;
				try {
					i = dao.addVoter(voter);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (i!=0) {
					RequestDispatcher rd = req.getRequestDispatcher("/VoterRegistrationSuccess.jsp");
					rd.forward(req, rsp);
				}
				else {
					RequestDispatcher rd = req.getRequestDispatcher("/VoterRegistrationFailed.jsp");
					rd.forward(req, rsp);
				}
			
		}
		else if(parameter.equals("frgt pwd")){
			String uname = (String) req.getParameter("uname");
			String pwd = (String) req.getParameter("rpwd");
			
			int i = dao.updatePwd(uname,pwd);
			if(i>0) {
			rsp.sendRedirect("/OnlineVotingSystem/Home.jsp");
			}
		}
	else if(parameter.equals("contest")) {
			String eID = (String) req.getParameter("eid");
			String vID = (String) req.getParameter("vid");
			String name = (String) req.getParameter("Name");
			Voter voter = new Voter();
			try {
				voter = dao.getVoter(vID);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(!voter.isCandidate()) {
			Candidate candidate = new Candidate(vID,voter.getName(),voter.getAge(),eID,"General",voter.getConstituency(),"Volunteer");
			try {
				int i = dao.addCandidate(candidate);
				int j = dao.updateIsCandidateVoter(vID);
				req.setAttribute("eid", eID);
				req.setAttribute("vid", vID);
				req.setAttribute("Name", name);
				if (i!=0 && j!=0) {
					RequestDispatcher rd = req.getRequestDispatcher("/CandidateRegistrationSuccess.jsp");
					rd.forward(req, rsp);
				}
				else {
					RequestDispatcher rd = req.getRequestDispatcher("/CandidateRegistrationFailed.jsp");
					rd.forward(req, rsp);
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("/AlreadyCandidate.jsp");
				rd.forward(req, rsp);
			}
		}
	
		else if(parameter.equals("Logout")) {
		/*	int c=(Integer)ctx.getAttribute("currentusers");
			if(req.getSession(false).getAttribute("User")!=null && (c==1) ) {
			req.getSession().invalidate();
			}
		    if(c==0) { */
			RequestDispatcher rd = req.getRequestDispatcher("/Logout.jsp");
			rd.forward(req,rsp);
		}
		else if(parameter.equals("Election List")) {
			List<Election> elist = new ArrayList<Election>();
			elist = dao.getAllElections(); 
			if(elist!= null) {
				req.setAttribute("list",elist);
				RequestDispatcher rd = req.getRequestDispatcher("/Logout.jsp");
				rd.forward(req,rsp);
			}
			else {
			RequestDispatcher rd = req.getRequestDispatcher("/Logout.jsp");
			rd.forward(req,rsp);
			}
		}
		else if(parameter.equals("Send OTP")){
			String eID = (String) req.getParameter("eid");
			String cID = (String) req.getParameter("cid");
			String vID = (String) req.getParameter("vid");
			String name = (String) req.getParameter("Name");
			SendSMS sms = new SendSMS();
			int otp = sms.generateOtp();
			req.setAttribute("eid",eID);
			req.setAttribute("cid",cID);
			req.setAttribute("vid",vID);
			req.setAttribute("Name", name);
			Voter voter = new Voter();
			try {
				voter = dao.getVoter(vID);
				if(!voter.isVoted()) {
				System.out.println(voter.getSsn()+"****"+voter.getMobnum());
				req.setAttribute("SSN", voter.getSsn());
				req.setAttribute("OTP", otp);
				//String msg = sms.sendSms(otp, voter.getMobnum());
				sms.sendMail(otp, voter.getEmail());
				//System.out.println(msg);
				RequestDispatcher rd = req.getRequestDispatcher("/getOTP.jsp");
				rd.forward(req,rsp);
				}else {
					RequestDispatcher rd = req.getRequestDispatcher("/voted.jsp");
					rd.forward(req,rsp);	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(parameter.equals("Confirm Vote")) {
			String eID = (String) req.getParameter("eid");
			String cID = (String) req.getParameter("cid");
			String vID = (String) req.getParameter("vid");
			String iotp = (String) req.getParameter("iotp");
			String gotp =(String) req.getParameter("gotp");
			String issn =(String) req.getParameter("issn");
			String gssn =(String) req.getParameter("gssn");
			req.setAttribute("eid",eID);
			req.setAttribute("cid",cID);
			req.setAttribute("vid",vID);
			System.out.println(gotp+"*"+iotp+"*"+gssn+"*"+issn);
			try {
				if(iotp.equals(gotp) && issn.equals(gssn)){
					int i = dao.vote1(eID, cID);
					int j = dao.vote2(vID);
					if (i!=0 && j!=0) {
						RequestDispatcher rd = req.getRequestDispatcher("/VoteSuccess.jsp");
						rd.forward(req,rsp);
					}
				}else{
					List<Candidate> clist = new ArrayList<Candidate>();
					try {
						clist = dao.getAllCandidates(eID);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					req.setAttribute("clist", clist);
					RequestDispatcher rd = req.getRequestDispatcher("/VoteFailed.jsp");
					rd.forward(req,rsp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (parameter.equals("candidateList")) {
			String eID = (String) req.getParameter("eid");
			String vID = (String) req.getParameter("vid");
			String vName = (String) req.getParameter("Name");
			req.setAttribute("eid",eID.trim());
			req.setAttribute("vid",vID.trim());
			req.setAttribute("Name",vName.trim());
			System.out.println(eID);
			System.out.println(vID);
			System.out.println(vName);
			List<Candidate> clist = new ArrayList<Candidate>();
			try {
				clist = dao.getAllCandidates(eID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(clist!=null) {
				req.setAttribute("clist", clist);
				RequestDispatcher rd = req.getRequestDispatcher("/Vote.jsp");
				rd.forward(req,rsp);
			}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("/Logout.jsp");
				rd.forward(req,rsp);
			}
      }
		else if(parameter.equals("approve")){
				String eID = (String) req.getParameter("eid");
				String cID = (String) req.getParameter("cid");
				String ca = (String) req.getParameter("ca");
				try {
					int i = 0;
					if(ca.equalsIgnoreCase("approve")) {
					i = dao.approveCandidate(cID);
					}else if(ca.equalsIgnoreCase("reject")){
						i = dao.rejectCandidate(cID);
					}
					if(i>0) {
						RequestDispatcher rd = req.getRequestDispatcher("/CandidateApproved.jsp");
						rd.forward(req,rsp);
					}else {
						RequestDispatcher rd = req.getRequestDispatcher("/Failure.jsp");
						rd.forward(req,rsp);
				}} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		else if(parameter.equals("Home")) {
			rsp.sendRedirect("/OnlineVotingSystem/VoterHome.jsp");
		}
		else if(parameter.equals("conduct")){
			String eid = (String)req.getParameter("eid");
			int i = dao.activateElection(eid);
			if(i>0) {
				RequestDispatcher rd = req.getRequestDispatcher("/Conduct.jsp");
				rd.forward(req,rsp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("/Failure.jsp");
				rd.forward(req,rsp);
			}
		}
		else if(parameter.equals("View Result") || parameter.equals("declare")) {
			List<Candidate> rlist;
			try {
				if(parameter.equals("View Result")){
				rlist = dao.announceResult(null,"voter");
			}else {
				 rlist = dao.announceResult((String)req.getParameter("eid"),"admin");
				 int i = dao.updateElection((String)req.getParameter("eid"), rlist.get(0).getCid());
			}
					req.setAttribute("rlist", rlist);
					RequestDispatcher rd = req.getRequestDispatcher("/ElectionResult.jsp");
					rd.forward(req,rsp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(parameter.equals("addElection")) {
			Election election = new Election(req.getParameter("ename"),req.getParameter("constituency"),req.getParameter("date"),req.getParameter("ndate"));
			try {
				int i = dao.addElection(election);
				if(i>0) {
					RequestDispatcher rd = req.getRequestDispatcher("/ElectionAdded.jsp");
					rd.forward(req,rsp);
				}else {
					RequestDispatcher rd = req.getRequestDispatcher("/Failure.jsp");
					rd.forward(req,rsp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}	else if(parameter.equals("updateVoter")) {
			Voter voter = new Voter(req.getParameter("vname"),req.getParameter("constituency"),Integer.parseInt(req.getParameter("age")),req.getParameter("ssn"),req.getParameter("uname"),req.getParameter("pwd"),Long.parseLong(req.getParameter("num")),req.getParameter("email"),req.getParameter("sex"));
			String vid = req.getParameter("vid");
			int i = 0;
			i = dao.updateVoter(voter,vid);
			if (i!=0) {
				ArrayList<Election> ealist = (ArrayList<Election>) dao.getAllElections();
				ArrayList<Election> evlist = new ArrayList<Election>();
				ArrayList<Election> eilist = new ArrayList<Election>();
				ealist.forEach(election ->{ 
					if(election.getConstituency().equals(voter.getConstituency()) && election.getWinner()==0){
						if(election.getIsActive()) {
							evlist.add(election);
							}else{
								eilist.add(election);
								}
					}
					});
					req.setAttribute("User", "Voter");
					req.setAttribute("elist", evlist);
					req.setAttribute("eilist", eilist);
					req.setAttribute("vid",vid);
					req.setAttribute("Name", voter.getName());
					req.setAttribute("Voted", voter.isVoted());
					RequestDispatcher rd = req.getRequestDispatcher("/VoterHome.jsp");
					rd.forward(req, rsp);
				}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("/updateInfo.jsp");
				rd.forward(req, rsp);
			}
		}else if(parameter.equals("Update Information")) {
			req.setAttribute("vid",(String)req.getParameter("vid"));
			RequestDispatcher rd = req.getRequestDispatcher("/updateInfo.jsp");
			rd.forward(req, rsp);
		}
        else {
        	RequestDispatcher rd = req.getRequestDispatcher("/LogoutOlderSession.jsp");
			rd.forward(req,rsp);
        }
	}   
	
}
