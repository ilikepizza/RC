// Can you imagine, the operators == and != are not defined for Booleans ...
 
/* Compares two bools, returns true, if both are true or both are false. 
 * Params: [Boolean, Boolean]
 * Returns: Boolean
 */
boolsEqual = {
    private ["_a", "_b"];
    _a = _this select 0;
    _b = _this select 1;
    
    (_a and _b) or not (_a or _b)
};

/* Compares two bools, returns true, if one is true und the other is false. This is logical xor.
 * Params: [Boolean, Boolean]
 * Returns: Boolean
 */
boolsUnequal = {
    private ["_a", "_b"];
    _a = _this select 0;
    _b = _this select 1;
    
  	((_a or _b) and not (_a and _b))
};