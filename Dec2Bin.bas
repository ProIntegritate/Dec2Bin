Module Module1

    ' Console application if you had not guessed it yet.
    Sub Main()

        Dim sString() As String = Environment.GetCommandLineArgs()
        Dim sSourceFile As String = ""
        Dim sDestFile As String = ""

        If UBound(sString) < 1 Then
            Console.WriteLine("Dec2Bin: <infile> <outfile>")
            End
        End If

        ' Do not assume that the user provides parameters
        Try
            sSourceFile = sString(1)
        Catch ex As Exception
        End Try
        Try
            sDestFile = sString(2)
        Catch ex As Exception
        End Try

        ' Trap possible errors
        If sSourceFile.Trim = "" Or sDestFile.Trim = "" Then End
        If Dir(sSourceFile) = "" Then End
        If FileLen(sSourceFile) = 0 Then End

        Dim sIndata As String = ""
        Try ' Can still be a problem with the file, ACL or whatnot
            sIndata = System.IO.File.ReadAllText(sSourceFile)
        Catch ex As Exception
        End Try

        Dim sArr() As String = sIndata.Split(",")

        Dim bByteArr(0 To UBound(sArr)) As Byte
        For n = 0 To UBound(sArr)
            Try
                bByteArr(n) = Byte.Parse(sArr(n))
            Catch ex As Exception
                ' Ignore errors for now and just .Parse()
            End Try
        Next

        Try
            System.IO.File.WriteAllBytes(sDestFile, bByteArr)
        Catch ex As Exception
        End Try

        Console.WriteLine("Dec2Bin - Done.")

    End Sub

End Module
