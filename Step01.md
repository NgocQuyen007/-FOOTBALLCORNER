# -FOOTBALLCORNER
This is my thesis at Da nang university of science and technology. Project help some pitch in Da nang city and football player can easy to contact with each other.
# Code review

```
@RequestMapping(value="login", method=RequestMethod.POST)
	public String submitLoginPage(@RequestParam final String name, @RequestParam final String password, ModelMap map) {
		System.out.println("ZOZO");
		Map<String, String> info = new LinkedHashMap<>();
		info.put("name", name);
		info.put("password", password); <b/>
		map.addAllAttributes(info);
		return "welcome";
	}
```
