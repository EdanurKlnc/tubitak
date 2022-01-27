using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HUS_new.Startup))]
namespace HUS_new
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
