namespace loginForm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class StudentsClassInitialMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Students",
                c => new
                    {
                        studentId = c.Int(nullable: false, identity: true),
                        firstName = c.String(),
                        lastName = c.String(),
                        isActive = c.Boolean(nullable: false),
                        dateOfBirth = c.DateTime(),
                        District = c.String(),
                        Municipality = c.String(),
                        Address = c.String(),
                        Gender = c.String(),
                        Photo = c.Binary(),
                    })
                .PrimaryKey(t => t.studentId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Students");
        }
    }
}
