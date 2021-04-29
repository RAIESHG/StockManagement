-- q no 12
SELECT * FROM dbo.Member where dbo.Member.MemberNumber = ((Select (dbo.CustomerPurchase.MemberNumber) from dbo.Member
Join dbo.CustomerPurchase on dbo.Member.MemberNumber=dbo.CustomerPurchase.MemberNumber)
EXCEPT
(Select dbo.CustomerPurchase.MemberNumber from dbo.Member
Join dbo.CustomerPurchase on dbo.Member.MemberNumber=dbo.CustomerPurchase.MemberNumber
where dbo.CustomerPurchase.BillingDate>='2021-03-28'))



-- q no 13
