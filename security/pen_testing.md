# Repository for useful commands, notes, etc.

## Enumeration

Some useful `nmap` commands:

```bash
nmap -p 445 --script vuln <target ip>
```

`-p`: Set destination port

`445`: The vulnerable port

`-script vuln`: Check for specific known vulnerabilities and generally only report results if they are found


```bash
nmap -sV -O -F --version-light <target ip>
```

`-sV`: Probe open ports to determine service/version info

`-O`: Enable OS detection

`-F`: Fast mode - Scan fewer ports than the default scan

`--version-light`: Limit to most likely probes (intensity 2)

```
nmap -A <target ip>
```

`-A`: Enable OS detection, version detection, script scanning, and traceroute, pretty robust

---

## Exploitation

### `metasploit`

Searching: 

* Can search for exploits with `search <cve, exploit name, etc>`
* Can use `searchsploit` outside of `msfconsole` to search vulns and exploits
* Once `set RHOSTS <target ip>` is  set, can run `check` to see if target is vulnerable
  
### [Meterpreter](https://www.offensive-security.com/metasploit-unleashed/about-meterpreter/)

"Meterpreter is an advanced, dynamically extensible payload that uses in-memory DLL injection stagers and is extended over the network at runtime. It communicates over the stager socket and provides a comprehensive client-side Ruby API. It features command history, tab completion, channels, and more.

Commands can be found [here](https://www.offensive-security.com/metasploit-unleashed/meterpreter-basics/)