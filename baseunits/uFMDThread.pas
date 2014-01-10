unit uFMDThread;

{$mode delphi}

interface

uses
  Classes, SysUtils;

type
  TFMDThread = class(TThread)
  private
    FIsTerminated,
    FIsSuspended: Boolean;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor  Destroy; override;

    property    IsTerminated: Boolean read FIsTerminated write FIsTerminated;
    property    IsSuspended: Boolean read FIsSuspended write FIsSuspended;
  end;

implementation

constructor TFMDThread.Create(CreateSuspended: Boolean);
begin
  FIsSuspended := TRUE;
  FIsTerminated:= FALSE;
  inherited Create(FALSE);
end;

destructor  TFMDThread.Destroy;
begin
  FIsTerminated:= TRUE;
  inherited Destroy;
end;

end.

