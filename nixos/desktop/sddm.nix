{pkgs, inputs, ...}: {
imports = [ inputs.silentSDDM.nixosModules.default ];

	programs.silentSDDM = {
		enable = true;
		theme = "default-left";
		backgrounds = {
			cemetery = ~/.config/dotfiles/assets/Wallpapers/untilThen/cemetery.mp4;
		};
		profileIcons = {
			andiurne = ~/.config/dotfiles/assets/Images/PFPs/currents/andiurne.png;
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
				background = "cemetery";
				blur = 0;
				brightness = 0;

				Clock = {
					display = true;
					position = "top-right";
					align = "right";
					format = "HH:mm";
					font-size = 70;
					font-weight = 900;
					color = "#ffffff";
				};

				Date = {
					display = true;
					format = "dddd, MMMM dd, yyyy";
					locale = "en_US";
					font-size = 30;
					font-weight = 600;
					color = "#ffffff";
					margin-top = 10;
				};

				Message = {
					display = false;
				};
			};

			LoginScreen = {
				background = "cemetery";
				blur = 0;
				brightness = 0;

				LoginArea = {
					position = "right";
					margin = 120;
					Avatar = {
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
					Username = {
						#font-family
						font-size = 16;
						font-weight = 700;
						color = "#ffffff";
						margin = 10;
					};
					PasswordInput = {
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
					LoginButton = {

					};
					Spinner = {};
					WarningMessage = {};
				};

				MenuArea = {};
				VirtualKeyboard = {};
			};

			Tooltips.enable = true;
		};
	};
  }
