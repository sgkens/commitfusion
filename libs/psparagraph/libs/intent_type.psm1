Add-Type -TypeDefinition @"
using System;
using System.Text;

public class Indenter
{
    public static string NewIndent(int position, int indent, string str)
    {
        var StringBuilder = new StringBuilder();
        var words = str.Split(' ');

        int currentLineLength = 0;
        StringBuilder.Append(' ', indent);
        foreach (var word in words)
        {
            if (currentLineLength + word.Length > position)
            {
                StringBuilder.AppendLine();
                StringBuilder.Append(' ', indent);
                currentLineLength = 0;
            }

            StringBuilder.Append(word);
            StringBuilder.Append(' ');
            currentLineLength += word.Length + 1;
        }

        return StringBuilder.ToString();
    }
}
"@