{pkgs, inputs, ...}: {
imports = [ inputs.silentSDDM.nixosModules.default ];

	programs.silentSDDM = {
		enable = true;
		theme = "default-left";
		backgrounds = {
			#cemetery = /home/andiurne/.config/dotfiles/assets/Wallpapers/untilThen/cemetery.mp4;
			shizune = pkgs.fetchurl {
				name = "shizune.jpg";
				url = "https://images.steamusercontent.com/ugc/2389811413355892693/D6EDB292DBAAF3481CDE3D31871A164364A9AF5B/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false";
				hash = "sha256-flMdQleLCQhmOZTY8iPx8DkiAdT2MfCirm3AZsJx9GQ=";
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

		settings = {
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
				background = "shizune";
				blur = 0;
				brightness = 0;
			};

			"LockScreen.Clock" = {
				display = true;
				position = "top-right";
				align = "right";
				format = "HH:mm";
				font-size = 70;
				font-weight = 900;
				color = "#FFFFFF";
			};

			"LockScreen.Date" = {
				display = true;
				format = "dddd, MMMM dd, yyyy";
				locale = "en_US";
				font-size = 30;
				font-weight = 600;
				color = "#ffffff";
				margin-top = 10;
			};

			"LockScreen.Message" = {
				display = false;
				};

			LoginScreen = {
				background = "shizune";
				blur = 0;
				brightness = 0;
			};

			"LoginScreen.LoginArea" = {
				position = "right";
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
				active-border-color = "#ffffff";
				inactive-border-color = "#aaaaaa";
				};

			"LoginScreen.LoginArea.Username" = {
				#font-family
				font-size = 16;
				font-weight = 700;
				color = "#ffffff";
				margin = 10;
			};
			"LoginScreen.LoginArea.PasswordInput" = {
				width = 200;
				height = 30;
				display-icon = true;
				#font-family
				font-size = 12;
				content-color = "#FFFFFF";
				background-color = "#FFFFFF";
				background-opacity = 0.15;
				border-size = 0;
				border-radius-left = 10;
				border-radius-right = 10;
				margin-top = 10;
			};
			"LoginScreen.LoginArea.LoginButton" = {};
			"LoginScreen.LoginArea.Spinner" = {};
			"LoginScreen.LoginArea.WarningMessage" = {};
			"LoginScreen.MenuArea" = {};
			"LoginScreen.VirtualKeyboard" = {};

			"Tooltips".enable = true;
		};
	};
  }
