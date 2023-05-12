internal partial class Program
{
    class Customer
    {
        public Customer(string firstname, string lastname)
        {
            Firstname = firstname;
            Lastname = lastname;
        }

        public string Firstname { get; }
        public string Lastname { get; }
    }
}