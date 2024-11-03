using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Kendo.PlayGround.WebUI.Controllers;

[Authorize]
public class ServerGridController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public
}
