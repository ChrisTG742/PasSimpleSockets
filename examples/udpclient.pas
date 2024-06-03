program udpclient;

{$mode objfpc}{$H+}

uses
  SimpleSockets;

var
  Sock: TSocket;
  Msg: TReceiveFromStringMessage;
begin
  Sock := UDPSocket(stIPv4);
  try
    SendStrTo(Sock, IN4Address('127.0.0.1'), 1337, 'Hello UDP');
    Msg := ReceiveStrFrom(Sock);
    WriteLn('Server at ', Msg.FromAddr.Address, ':', Msg.FromPort, ' answered: ', Msg.Data);
  finally
    CloseSocket(Sock);
  end;
  ReadLn;
end.

