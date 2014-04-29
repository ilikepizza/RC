/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */

//Usage
//Scalar = [Scalar, Scalar] call absDiff;
RC_math_absDiff = {
    _a = _this select 0;
    _b = _this select 1;
    
    abs (_a - _b)
};