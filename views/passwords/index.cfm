<cfoutput>
	<!--- MessageBox --->
	<cfif flash.exists( "notice" )>
		<div class="alert alert-#flash.get( "notice" ).type#">
			#flash.get( "notice" ).message#
		</div>
	</cfif>
	<nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#event.buildLink('')#">Home</a></li>
          <li class="breadcrumb-item active" aria-current="passwords">Passwords</li>
        </ol>
	</nav>



<!--- Create Button --->
#html.href( href="passwords.new", text="Create password", class="btn btn-primary" )#

<!--- Listing --->

<table class="table table-hover table-striped">
	<thead>
		<tr>
		
			
			<th>appname</th>
			
		
			
			<th>env</th>
			
		
			
			<th>password</th>
			
		
			
		
			
			<th>url</th>
			
		
			<th width="200px">Actions</th>
		</tr>
	</thead>
	
	<tbody>
		<cfloop array="#prc.passwords#" index="thisRecord">
		<tr>
			
				
					<td>#thisRecord.getappname()#</td>
				
			
				
					<td>#thisRecord.getenv()#</td>
				
			
				
					<td>#thisRecord.getpassword()#</td>
				
			
				
			
				
					<td>#thisRecord.geturl()#</td>
				
			
			
			<td>
				#html.startForm( action="passwords.delete" )#
					#html.hiddenField( name="passwordID", bind=thisRecord )#
					#html.submitButton( value="Delete", onclick="return confirm('Really Delete Record?')", class="btn btn-danger" )#
					#html.href( 
						href		= "passwords.edit", 
						queryString	= "passwordID=#thisRecord.getpasswordID()#", 
						text 		= "Edit", 
						class		= "btn btn-info"
					)#
				#html.endForm()#
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>

<div class="jumbotron">
	<p>
	  This Page is protected page, can be ONLY seen by Signed In Users
	</p>
   <p>
	  Quick Ref: Protected by CBSecurity Module
   </p>     
   <a class="btn btn-primary btn-lg" href="https://coldbox-security.ortusbooks.com/" target="_blank" role="button">Learn more</a>
</div>

<div class="jumbotron">
	  <p>
		This Page is generated by ColdBox ORM Scaffolding
	  </p>
	 <p>
		Quick Ref: 1) Setup Database, 2) install CBOrm module and config, 3) Scaffold by: 
	 </p>     
	 <pre>
		<code>coldbox create orm-entity entityName=password primaryKey=passwordID properties=password,env,appname,url</code>
		<code>coldbox create orm-crud entity=models.password pluralName=passwords</code>
	</pre>
	 <a class="btn btn-primary btn-lg" href="https://coldbox.ortusbooks.com/the-basics/models/coding-orm-scaffolding" target="_blank" role="button">Learn more</a>
  </div>


</cfoutput>