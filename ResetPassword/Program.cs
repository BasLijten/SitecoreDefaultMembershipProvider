using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;

namespace ResetPassword
{
    class Program
    {
        static void Main(string[] args)
        {
            string encpwd = "5J1irmSbXoEVWMQA0rxa8T3/CZJUV+7rov1Yh5D+vL4=";
            byte[] bpasswd = Convert.FromBase64String(encpwd);

            string userId = @"sitecore\admin";
            string passwd = String.Empty;            
            MembershipUser user = Membership.GetUser(userId, false);
            passwd = user.ResetPassword();
            Console.WriteLine(passwd);
            Console.ReadLine();
        }
    }
}
