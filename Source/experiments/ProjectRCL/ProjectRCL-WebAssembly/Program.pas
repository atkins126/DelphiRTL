﻿namespace ProjectRCLWebAssembly;

uses
  RemObjects.Elements.RTL.Delphi, RemObjects.Elements.RTL.Delphi.VCL;

type
  [Export]
  Program = public class
    const FilerSignature: UInt32 = $30465054; // 'TPF0'
  public

    method HelloWorld;
    begin
      writeLn('HelloWorld');
      var el := WebAssembly.GetElementById('helloWorld');
      if el = nil then begin
        writeLn('Element by ID test is null!');
        exit;
      end;
      var t2 := WebAssembly.CreateTextNode('Hello from Elements WebAssembly!');
      el.appendChild(t2);

      {var lMem := new TMemoryStream();
      var lWord: Integer := 1200;
      lMem.WriteData(FilerSignature);
      lMem.Position := 0;
      var lOtWord: UInt32 := 0;
      lMem.ReadData(var lOtWord);
      writeLn(lOtWord);}

      Application.Initialize;
      Application.CreateForm(typeOf(TForm6), var Form6);
      Application.Run;
    end;

  end;

end.