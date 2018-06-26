namespace loginForm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DateOfBirthTypeChangedToString : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Students", "dateOfBirth", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Students", "dateOfBirth", c => c.DateTime());
        }
    }
}
