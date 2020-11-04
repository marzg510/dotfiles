Function GetCopyFileName(full_name, seq)
    Dim fso
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")
    Set reg = New RegExp
    reg.Pattern = "\/"
    reg.Global = True
    GetCopyFileName = fso.BuildPath(fso.GetParentFolderName(full_name), fso.GetBaseName(full_name) & "_" & reg.Replace(FormatDateTime(Now, 2), "") & "bk" & seq & "." & fso.GetExtensionName(full_name))
End Function

Dim src_full_name
Dim dst_full_name
Dim fso
Dim i
src_full_name = WScript.Arguments(0)
Set fso = WScript.CreateObject("Scripting.FileSystemObject")
For i = 1 To 99
    dst_full_name = GetCopyFileName(src_full_name, i)
    If (Not fso.FileExists(dst_full_name)) Then
        Exit For
    End If
    dst_full_name = ""
Next 

If (dst_full_name <> "") Then
    Call fso.CopyFile(src_full_name, dst_full_name)
Else
    WScript.Echo "can't backup " & fso.GetFileName(src_full_name)
End If

