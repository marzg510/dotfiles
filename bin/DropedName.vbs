'Droped Name (dropedname.vbs)
'2003.03.25

For Each n In WScript.Arguments
 T = T & n & vbCrLf
Next

Set IE = CreateObject("InternetExplorer.Application")
IE.Navigate "about:blank"

Do Until IE.ReadyState = 4
 WScript.Sleep 1
Loop

IE.Document.ParentWindow.ClipboardData.SetData "Text", T
IE.Quit
