﻿namespace RemObjects.Elements.RTL.Delphi.VCL;

{$IF ISLAND AND WINDOWS}

interface

uses
  RemObjects.Elements.RTL.Delphi;

type
  TApplication = public partial class(TComponent)
  protected
    method IsKeyMsg(var aMsg: rtl.MSG): Boolean;
  public
    method CreateForm(InstanceClass: TComponentClass; var aFormRef); partial;
    method Initialize; partial;
    method Run; partial;
    method Terminate; partial;
  end;

implementation

method TApplication.CreateForm(InstanceClass: TComponentClass; var aFormRef);
begin
  var lCtor: MethodInfo;
  var FormRef: TForm := TForm(aFormRef);

  var lCtors := InstanceClass.Methods.Where(a -> ((MethodFlags.Constructor in a.Flags) and (a.Arguments.Count > 0)));
  if lCtors.Count > 1 then begin
    for each lTemp in lCtors do begin
      var lArguments := lTemp.Arguments.ToList;
      if lArguments[0].Type = typeOf(TComponent) then begin
        lCtor := lTemp;
        break;
      end;
    end;
  end
  else
    lCtor := lCtors.FirstOrDefault;

  if lCtor = nil then raise new Exception('No default constructor could be found!');
  var lNew := DefaultGC.New(InstanceClass.RTTI, InstanceClass.SizeOfType);
  FormRef := InternalCalls.Cast<TForm>(lNew);
  lCtor.Invoke(FormRef, [nil]);
  aFormRef := FormRef;
  if fMainForm = nil then begin
    fMainForm := FormRef;
  end;
end;

method TApplication.Initialize;
begin
  THighDPI.Initialize;
end;

method TApplication.Run;
begin
  if fMainForm <> nil then
    fMainForm.Show;

  var lMsg: rtl.MSG;

  while not Finished do begin
    if rtl.PeekMessageW(@lMsg, nil, 0, 0, rtl.PM_REMOVE) then begin
      if not IsKeyMsg(var lMsg) then begin
        rtl.TranslateMessage(@lMsg);
        rtl.DispatchMessage(@lMsg);
      end;
    end;

    if (lMsg.message = rtl.WM_QUIT) or (lMsg.message = rtl.WM_CLOSE) then begin
      Terminate;
    end;
  end;
end;

method TApplication.Terminate;
begin
  fFinished := true;
end;

method TApplication.IsKeyMsg(var aMsg: rtl.MSG): Boolean;
begin
  result := false;
  //if aMsg.message in [rtl.WM_KEYFIRST..rtl.WM_KEYLAST] then begin
  if aMsg.message = rtl.WM_KEYDOWN then begin
    var lObject := rtl.GetWindowLongPtr(aMsg.hwnd, rtl.GWLP_USERDATA);
    if lObject <> 0 then begin
      var lControl := InternalCalls.Cast<TWinControl>(^Void(lObject));
      var lParentForm := lControl.GetParentForm;
      if lParentForm ≠ nil then
        result := (lParentForm.Perform(CN_BASE + aMsg.message, aMsg.wParam, aMsg.lParam) = 0);
    end;
  end;
end;

{$ENDIF}

end.