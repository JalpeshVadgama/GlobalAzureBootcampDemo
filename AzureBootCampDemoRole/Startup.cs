using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AzureBootCampDemoRole.Startup))]
namespace AzureBootCampDemoRole
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
