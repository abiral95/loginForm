namespace loginForm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PhotoAttributeTypeChangeToString : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Students", "Photo", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Students", "Photo", c => c.Binary());
        }
    }
}
