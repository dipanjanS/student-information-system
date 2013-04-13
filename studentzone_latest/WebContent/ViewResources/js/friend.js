function checkFriend()
{
	/*
	 * If already a friend then 
	 * do not show "Add as a friend" but "Unfriend"
	 * and if not a friend then " Add as a friend" 
	 */
	document.getElementById("isFriend").disabled = true;
	var cf = document.getElementById("hiddenFriend").value;
	//alert(document.getElementById("userID").value);
	var logId = document.getElementById("userID").value;
	var searchId = document.getElementById("hiddenFrdId").value;
	
	if(logId == searchId)
		{
		
		document.getElementById("Add").style.display = 'none';
		document.getElementById("Delete").style.display = 'none';
		}
	else
	{
		if(cf == 'true')
		{
			document.getElementById("isFriend").checked = true;
			document.getElementById("Add").style.display = 'none';
			document.getElementById("Delete").style.display = 'block';
		}
	else
		{
		document.getElementById("isFriend").checked = false;
		document.getElementById("Add").style.display = 'block';
		document.getElementById("Delete").style.display = 'none';
		}
	}
	
}