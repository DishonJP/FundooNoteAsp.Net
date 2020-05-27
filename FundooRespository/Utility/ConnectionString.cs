using System;
using System.Collections.Generic;
using System.Text;

namespace FundooRespository.Utility
{
    class ConnectionString
    {
        private static readonly string _connect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Projects\FundooNote\App_Data\FundooAppDB.mdf;Integrated Security=True";
        public static string ConnectionName
        {
            get => _connect;
        }
    }
}
