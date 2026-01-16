% startup.m

% Obtain the screen size using Java
screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
screenWidth = screenSize.getWidth();
screenHeight = screenSize.getHeight();

% Determine scaling factor based on resolution
if screenWidth >= 3840 && screenHeight >= 2160
    scalingFactor = 2.0; % For 4K displays
elseif screenWidth >= 2560 && screenHeight >= 1440
    scalingFactor = 2.0; % For QHD displays
else
    scalingFactor = 2.0; % For lower resolutions
end

% Access MATLAB settings
s = settings;
% Set the DisplayScaleFactor
s.matlab.desktop.DisplayScaleFactor.PersonalValue = scalingFactor;


set(0, 'DefaultAxesFontSize', 14);
set(0, 'DefaultTextFontSize', 14);
set(0, 'DefaultUIControlFontSize', 14);

beep off
