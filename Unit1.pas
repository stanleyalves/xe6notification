unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Notification, FMX.ListView.Types, IPPeerClient, REST.OpenSSL,
  REST.Backend.PushTypes, System.JSON, REST.Backend.KinveyPushDevice,
  System.PushNotification, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Backend.BindSource, REST.Backend.PushDevice, REST.Backend.KinveyProvider,
  FMX.ListView;

type
  TForm1 = class(TForm)
    NotificationCenter1: TNotificationCenter;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ListView1: TListView;
    KinveyProvider1: TKinveyProvider;
    PushEvents1: TPushEvents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  MyNotification : TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  Try
    MyNotification.AlertBody := '���W��ܳq���T��';
    NotificationCenter1.PresentNotification(MyNotification);
  Finally
    MyNotification.DisposeOf;
  End;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  MyNotification : TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  Try
    MyNotification.Name := 'ScheduleNotification';
    MyNotification.AlertBody := '�Q����ܳq���T��';
    MyNotification.FireDate := Now + EncodeTime(0,0,10,0);
    NotificationCenter1.ScheduleNotification(MyNotification);
  Finally
    MyNotification.DisposeOf;
  End;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NotificationCenter1.CancelNotification('ScheduleNotification');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  MyNotification : TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  Try
    MyNotification.Name := 'ActionNotification';
    MyNotification.AlertBody := '���W��ܳq���T��';
    MyNotification.AlertAction := '����ʧ@';
    MyNotification.HasAction := True;
    MyNotification.FireDate := Now + EncodeTime(0,0,10,0);
    NotificationCenter1.ScheduleNotification(MyNotification);
  Finally
    MyNotification.DisposeOf;
  End;
end;

procedure TForm1.NotificationCenter1ReceiveLocalNotification(Sender: TObject;
  ANotification: TNotification);
begin
  ShowMessage(ANotification.Name +'�ʧ@�Q����F!');
end;

procedure TForm1.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
 // showmessage(adata.Message);
  ListView1.Items.Add.Text := AData.Message;
end;

end.
