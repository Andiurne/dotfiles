{pkgs, inputs, ...}: {
imports = [ inputs.silentSDDM.nixosModules.default ];

	programs.silentSDDM = {
		enable = true;
		theme = "default-left";
		backgrounds = {
			#cemetery = /home/andiurne/.config/dotfiles/assets/Wallpapers/untilThen/cemetery.mp4;
      lilly_emptyLeft = ../assets/backgrounds/lilly_emptyLeft.png;
			shizune = pkgs.fetchurl {
				name = "shizune.jpg";
				url = "https://images.steamusercontent.com/ugc/2389811413355892693/D6EDB292DBAAF3481CDE3D31871A164364A9AF5B/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false";
				hash = "sha256-flMdQleLCQhmOZTY8iPx8DkiAdT2MfCirm3AZsJx9GQ=";
			};
      UT_festival = pkgs.fetchurl {
          name = "UT_festival.jpg";
          url = "https://eip.gg/wp-content/uploads/2024/06/Until-Then-Nicole-and-Mark.jpg";
          hash = "sha256-IcU+WKf2fXKQzWNh6elj19aIwfe0jDTX+b4jBvkaC8I=";
        };
		};
		profileIcons = {
			andiurne = pkgs.fetchurl {
				name = "andiurne.png";
				url = "https://avatars.githubusercontent.com/u/213026214";
				hash = "sha256-G3mzXHITC/VHfz4oo3REVHleVMVJp0cYP+wqFjjDP8I=";
			};
			#andiurne = /home/andiurne/.config/dotfiles/assets/Images/PFPs/currents/andiurne.png;
		};

		settings = let
			primary = "#A19552";
			secondary = "#aaaaaa";
		in {
			General = {
				enable-animations = true;
				animated-background-placeholder = "";
			};

			LockScreen = {
				display = true;
				padding-top = 0;
				padding-right = 120;
				padding-bottom = 0;
				padding-left = 0;
				background = "lilly_emptyLeft";
				blur = 0;
				brightness = 0;
			};

			"LockScreen.Clock" = {
				display = true;
				position = "top-left";
				align = "left";
				format = "HH:mm";
				font-size = 70;
				font-weight = 900;
				color = primary;
			};

			"LockScreen.Date" = {
				display = true;
				format = "dddd, MMMM dd, yyyy";
				locale = "en_US";
				font-size = 30;
				font-weight = 600;
				color = primary;
				margin-top = 10;
			};

			"LockScreen.Message" = {
				display = false;
				};

			LoginScreen = {
				background = "lilly_emptyLeft";
				blur = 0;
				brightness = 0;
			};

			"LoginScreen.LoginArea" = {
				#position = "right";
				margin = 120;
			};

			"LoginScreen.LoginArea.Avatar" = {
				shape = "square";
				border-radius = 35;
				active-size = 120;
				inactive-size = 80;
				inactive-opacity = 0.35;
				active-border-size = 3;
				inactive-border-size = 2;
				active-border-color = primary;
				inactive-border-color = secondary;
				};

			"LoginScreen.LoginArea.Username" = {
				#font-family
				font-size = 16;
				font-weight = 700;
				color = primary;
				margin = 10;
			};
			"LoginScreen.LoginArea.PasswordInput" = {
				width = 200;
				height = 30;
				display-icon = true;
				#font-family
				font-size = 12;
				content-color = primary;
				background-color = primary;
				background-opacity = 0.15;
				border-size = 0;
				border-radius-left = 10;
				border-radius-right = 10;
				margin-top = 10;
			};
			"LoginScreen.LoginArea.LoginButton" = {};
			"LoginScreen.LoginArea.Spinner" = {};
			"LoginScreen.LoginArea.WarningMessage" = {};
			"LoginScreen.MenuArea.Session" = {
				content-color = primary;
			};
			"LoginScreen.MenuArea.Layout" = {
				content-color = primary;
			};
			"LoginScreen.MenuArea.Keyboard" = {
				content-color = primary;
			};
			"LoginScreen.MenuArea.Power" = {
				content-color = primary;
			};
			"LoginScreen.VirtualKeyboard" = {
				key-color = primary;
			};

			"Tooltips" = {
				enable = true;
				content-color = primary;
			};
		};
	};
  }
