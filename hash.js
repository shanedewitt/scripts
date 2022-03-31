function stringToHash(string) {
    // compute hash of string to 10 digits
    // hash can be negative
	var hash = 0;
	if (string.length == 0) return hash;
		for (i = 0; i < string.length; i++) {
			char = string.charCodeAt(i);
			hash = ((hash << 5) - hash) + char;
			hash = hash & hash;
		}
	return hash;
}

var value = "12345678901234567890";
console.log("Value is " + value);
console.log(stringToHash(value));

