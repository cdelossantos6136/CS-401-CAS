package lostandfound.controller;

import java.util.HashMap;
import java.util.Map;
import lostandfound.model.Session;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

public class IndexController {
	
	public static ModelAndView getIndex( Request request, Response response ) {
		Map<String, String> templateVars = new HashMap<String, String>();
		Session session = new Session( request );
		
		// Choose which index to serve based on session information
		String template = ( session.isGuest() ) ? "indexServerSideEnabled" : "adminView";
		templateVars.put( "userFirstName", session.getUserFirstNameFromSession() );
		
		return new ModelAndView( templateVars, template );
	}	
	
	public static ModelAndView faq( Request request, Response response ){
		Map<String, String> templateVars = new HashMap<String, String>();
		
		return new ModelAndView( templateVars, "faq");
	}
}