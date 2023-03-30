function varargout = GUI_IP(varargin)
% GUI_INTERFACE MATLAB code for GUI_INTERFACE.fig
%      GUI_INTERFACE, by itself, creates a new GUI_INTERFACE or raises the existing
%      singleton*.
%
%      H = GUI_INTERFACE returns the handle to a new GUI_INTERFACE or the handle to
%      the existing singleton*.
%
%      GUI_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_INTERFACE.M with the given input arguments.
%
%      GUI_INTERFACE('Property','Value',...) creates a new GUI_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_INTERFACE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_INTERFACE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_INTERFACE

% Last Modified by GUIDE v2.5 12-Dec-2021 21:53:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_INTERFACE_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_INTERFACE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_INTERFACE is made visible.
function GUI_INTERFACE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_INTERFACE (see VARARGIN)

% Choose default command line output for GUI_INTERFACE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_INTERFACE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_INTERFACE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_Upload.
function btn_Upload_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpeg';'*.bmp'},'File Selector');
a = strcat(pathname, filename);
global b
b=imread(a);
axes(handles.axes1);
imshow(b);


% --- Executes on button press in btn_Process.
function btn_Process_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b
c=rgb2gray(b);
axes(handles.axes2);
imshow(c);


% --- Executes on button press in btn_Output.
function btn_Output_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b
d=im2bw(b);
axes(handles.axes3);
imshow(d);

BW2=imfill(d,'holes');
f = bwconncomp(BW2);
if(f.NumObjects > 5)
    set(handles.edit_1,'String','Diabetese risk');
    
else
    set(handles.edit_1,'String','No');
end



% --- Executes on button press in pushbutton3.
function btn_Reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
axes(handles.axes1);
imshow(a);
c=getappdata(0,'c');
axes(handles.axes2);
imshow(c);
d=getappdata(0,'d');
axes(handles.axes3);
imshow(d);

% --- Executes on button press in pushbutton4.
function btn_Exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Thank You!!!');
pause(3);
close();
close();


function edit_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_1 as a double





% --- Executes during object creation, after setting all properties.
function edit_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
