Попытка
	net = Новый COMОбъект("WScript.Shell");
	
	ПутьWinSCP = "C:\Program Files (x86)\WinSCP\WinSCP.com";
	ПрофильWinSCP = "sber";
	КаталогНаSFTPСервере = "/from_bank";
	ИмяФайлаСтр = "AVIB120.DBF";
	КаталогНаСервере1С = "C:\!!!";
	
	КаталогНаSFTPСервере = КаталогНаSFTPСервере+"/"+СтрЗаменить(Формат(ТекущаяДата(),"ДФ=yyyy-MM-dd"),"-","");
	Сообщить(КаталогНаSFTPСервере);
	
	СтрокаПрограммы = """C:\Program Files\Amicon\Client FPSU-IP\ip-client.exe"""+ " srvconnect6884";
	net.Run(СтрокаПрограммы);
	
	СтрокаПрограммы = """" +  ПутьWinSCP + """" + " /console /command " +  """option batch abort""    " + """open " +
	ПрофильWinSCP + """ " + """get "  + КаталогНаSFTPСервере + "/"
	+ ИмяФайлаСтр + " " + КаталогНаСервере1С + "\" + """ " + """close"" ""exit""";
	net.Run(СтрокаПрограммы);
	
	Скрипт = Новый COMОбъект("MSScriptControl.ScriptControl");
	Скрипт.Language = "javascript";
	Начало = Скрипт.Eval("(new Date()).valueOf()");
	Конец = Скрипт.Eval("(new Date()).valueOf()");
	Пока Конец - Начало < 10000 цикл 
		Конец = Скрипт.Eval("(new Date()).valueOf()");
	КонецЦикла;
	
	СтрокаПрограммы = """C:\Program Files\Amicon\Client FPSU-IP\ip-client.exe"""+ " srvdisconnect";
	net.Run(СтрокаПрограммы);
	СтрокаПрограммы = """C:\Program Files (x86)\1Cv77\BIN77\1cv7s.exe"" enterprise /D\\sql1\Base.1C\torg_sir2002 /Nrobot /Probot runZagruzkaIB /CloseYes";
	//net.Run(СтрокаПрограммы);
Исключение
	Сообщить("не получилось");
КонецПопытки;