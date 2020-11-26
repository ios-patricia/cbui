﻿component {

	/**
	 * Configure the ColdBox App For Production
	 */
	function configure() {
		/**
		 * --------------------------------------------------------------------------
		 * ColdBox Directives
		 * --------------------------------------------------------------------------
		 * Here you can configure ColdBox for operation. Remember tha these directives below
		 * are for PRODUCTION. If you want different settings for other environments make sure
		 * you create the appropriate functions and define the environment in your .env or
		 * in the `environments` struct.
		 */
		coldbox = {
			// Application Setup
			appName                  : getSystemSetting( "APPNAME", "Your app name here" ),
			eventName                : "event",
			applicationPath			 : "c:/wwwroot/cbui/",
			// Development Settings
			reinitPassword           : "",
			reinitKey                : "fwreinit",
			handlersIndexAutoReload  : true,
			// Implicit Events
			defaultEvent             : "",
			requestStartHandler      : "Main.onRequestStart",
			requestEndHandler        : "",
			applicationStartHandler  : "Main.onAppInit",
			applicationEndHandler    : "",
			sessionStartHandler      : "",
			sessionEndHandler        : "",
			missingTemplateHandler   : "",
			// Extension Points
			applicationHelper        : "includes/helpers/ApplicationHelper.cfm",
			viewsHelper              : "",
			modulesExternalLocation  : [],
			viewsExternalLocation    : "",
			layoutsExternalLocation  : "",
			handlersExternalLocation : "",
			requestContextDecorator  : "",
			controllerDecorator      : "",
			// Error/Exception Handling
			invalidHTTPMethodHandler : "",
			exceptionHandler         : "main.onException",
			invalidEventHandler      : "",
			customErrorTemplate      : "",
			// Application Aspects
			handlerCaching           : false,
			eventCaching             : false,
			viewCaching              : false,
			// Will automatically do a mapDirectory() on your `models` for you.
			autoMapModels            : true,
			// Auto converts a json body payload into the RC
			jsonPayloadToRC          : true
		};

		/**
		 * --------------------------------------------------------------------------
		 * Custom Settings
		 * --------------------------------------------------------------------------
		 */
		settings = {};

		/**
		 * --------------------------------------------------------------------------
		 * Environment Detection
		 * --------------------------------------------------------------------------
		 * By default we look in your `.env` file for an `environment` key, if not,
		 * then we look into this structure or if you have a function called `detectEnvironment()`
		 * If you use this setting, then each key is the name of the environment and the value is
		 * the regex patterns to match against cgi.http_host.
		 *
		 * Uncomment to use, but make sure your .env ENVIRONMENT key is also removed.
		 */
		environments = { development : "localhost,^127\.0\.0\.1" };

		/**
		 * --------------------------------------------------------------------------
		 * Module Loading Directives
		 * --------------------------------------------------------------------------
		 */
		modules = {
			// An array of modules names to load, empty means all of them
			include : [],
			// An array of modules names to NOT load, empty means none
			exclude : []
		};

		/**
		 * --------------------------------------------------------------------------
		 * Application Logging (https://logbox.ortusbooks.com)
		 * --------------------------------------------------------------------------
		 * By Default we log to the console, but you can add many appenders or destinations to log to.
		 * You can also choose the logging level of the root logger, or even the actual appender.
		 */
		logBox = {
			// Define Appenders
			appenders : { coldboxTracer : { class : "coldbox.system.logging.appenders.ConsoleAppender" } },
			// Root Logger
			root      : { levelmax : "INFO", appenders : "*" },
			// Implicit Level Categories
			info      : [ "coldbox.system" ]
		};

		/**
		 * --------------------------------------------------------------------------
		 * Layout Settings
		 * --------------------------------------------------------------------------
		 */
		layoutSettings = { defaultLayout : "", defaultView : "" };

		/**
		 * --------------------------------------------------------------------------
		 * Custom Interception Points
		 * --------------------------------------------------------------------------
		 */
		interceptorSettings = { customInterceptionPoints : [] };

		/**
		 * --------------------------------------------------------------------------
		 * Application Interceptors
		 * --------------------------------------------------------------------------
		 * Remember that the order of declaration is the order they will be registered and fired
		 */
		interceptors = [];

		/**
		 * --------------------------------------------------------------------------
		 * Module Settings
		 * --------------------------------------------------------------------------
		 * Each module has it's own configuration structures, so make sure you follow
		 * the module's instructions on settings.
		 *
		 * Each key is the name of the module:
		 *
		 * myModule = {
		 *
		 * }
		 */
		moduleSettings = {
			htmlhelper : { 
				 "js_path" : "includes",
			     "css_path" : "includes"
			 },
			 /**
			 * --------------------------------------------------------------------------
			 * cbSecurity Settings
			 * --------------------------------------------------------------------------
			 * We have pre-configured cbSecurity to secure the API using JWT Tokens
			 */
			cbauth: {
				userServiceClass: "UserService",
				// optional, override when needed
				sessionStorage: "SessionStorage@cbstorages",
				requestStorage: "RequestStorage@cbstorages"
			},
			// CB Security
			cbSecurity : {
				// The global invalid authentication event or URI or URL to go 
				// if an invalid authentication occurs
				"invalidAuthenticationEvent" : "auth.index",
				"defaultAuthenticationAction"	: "redirect",
				// The global invalid authorization event or URI or URL to go 
				// if an invalid authorization occurs
				"invalidAuthorizationEvent"  : "main.onInvalidAuthorization",
				// The validator is an object that will validate rules 
				// and annotations and provide feedback on either authentication or 
				// authorization issues.
				// WireBox ID of the user service to use
				"userService"                : "UserService",
				// Force SSL for all relocations
				"useSSL"            : false,
				// Activate handler/action based annotation security
				"handlerAnnotationSecurity"     : true
			},
			cbStorages : {
				cacheStorage : {
					cachename   : "template", // The CacheBox registered cache to store data in
					timeout     : 60 // The default timeout of the session bucket, defaults to 60
				},
			
				// Cookie Storage settings
				cookieStorage : {
					// Matches the secure attribute of cfcookie, ssl only
					secure 				: false,
					// If yes, sets cookie as httponly so that it cannot be accessed using JavaScripts
					httpOnly			: false,
					// Applicable global cookie domain
					domain 				: "cbui.ios.dfo",
					// Use encryption of values
					useEncryption 		: false,
					// The unique seeding key to use: keep it secret, keep it safe
					encryptionSeed 		: "CBStorages",
					// The algorithm to use: https://cfdocs.org/encrypt
					encryptionAlgorithm : "CFMX_COMPAT",
					// The encryption encoding to use
					encryptionEncoding 	: "Base64"
				}
			}
		};

		/**
		 * --------------------------------------------------------------------------
		 * Flash Scope Settings
		 * --------------------------------------------------------------------------
		 * The available scopes are : session, client, cluster, ColdBoxCache, or a full instantiation CFC path
		 */
		flash = {
			scope        : "session",
			properties   : {}, // constructor properties for the flash scope implementation
			inflateToRC  : true, // automatically inflate flash data into the RC scope
			inflateToPRC : false, // automatically inflate flash data into the PRC scope
			autoPurge    : true, // automatically purge flash data for you
			autoSave     : true // automatically save flash scopes at end of a request and on relocations.
		};

		/**
		 * --------------------------------------------------------------------------
		 * App Conventions
		 * --------------------------------------------------------------------------
		 */
		conventions = {
			handlersLocation : "handlers",
			viewsLocation    : "views",
			layoutsLocation  : "layouts",
			modelsLocation   : "models",
			eventAction      : "index",
			IncludesConvention: "includes"
		};
	}

	/**
	 * Development environment
	 */
	function development() {
		// coldbox.customErrorTemplate = "/coldbox/system/exceptions/BugReport.cfm"; // static bug reports
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/Whoops.cfm"; // interactive bug report
	}

}
