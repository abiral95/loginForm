using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(loginForm.Startup))]
namespace loginForm
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
