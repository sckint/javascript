	

<!--- control block --->

<cfif structKeyExists(url,'countryId')>
	<cfset loadState() />
</cfif>



<!--- default block --->

<cfset loadCountry() />

<!--- Function Block --->

<cffunction name="loadCountry" hint="I Load Country Details">
	<!--- Your datasource needs to be specified here --->
	<cfquery name="qCountry" datasource="datasource">
		DECLARE @MyTableVar table(
	   		id int,
	    	country varchar(100)
		);

		INSERT INTO @MyTableVar VALUES (1,'INDIA');
		INSERT INTO @MyTableVar VALUES (2,'RUSSIA');
		INSERT INTO @MyTableVar VALUES (3,'USA');

		SELECT * FROM @MyTableVar
	</cfquery>
</cffunction>	


<cffunction name="loadState" hint="I Load States Using Country Id">
	<cfset variables.country_id = url.countryId />
	<cfsetting SHOWDEBUGOUTPUT="no">
	<!--- Your datasource needs to be specified here --->
	<cfquery name="qState" datasource="datasource">
		DECLARE @MyTableVar table(
	   		id int,
	    	country varchar(100)
		);

		INSERT INTO @MyTableVar VALUES (1,'INDIA');
		INSERT INTO @MyTableVar VALUES (2,'RUSSIA');
		INSERT INTO @MyTableVar VALUES (3,'USA');

		DECLARE @MyStates table(
	   		id int,
	   		state varchar(100),
	    	countryId int
		);

		INSERT INTO @MyStates VALUES (1,'New Delhi',1);
		INSERT INTO @MyStates VALUES (2,'Maharastra',1);
		INSERT INTO @MyStates VALUES (3,'Kerala',1);
		
		INSERT INTO @MyStates VALUES (4,'Washington',3);
		INSERT INTO @MyStates VALUES (5,'California',3);

		INSERT INTO @MyStates VALUES (6,'Moscow',2);

		select * from @MyStates where countryId = 
		<cfqueryparam value="#variables.country_id#" cfsqltype="cf_sql_int">
		
	</cfquery>
	<cfoutput>
		<select name="state" class="form-control">
			<option value="">Select a State</option>
			<cfloop query="qState">
				<option value="#id#">#state#</option>
			</cfloop>
		</select>
	</cfoutput>
</cffunction>