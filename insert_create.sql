declare @TableName sysname = 'Orders'
declare @Result varchar(max) = 'Insert into ' + @TableName + ' (' 

select @Result = @Result + ColumnName + ', '
from (select replace(col.name, ' ', '_') ColumnName, column_id ColumnId from sys.columns col where object_id = object_id(@TableName)) t order by ColumnId
select @Result = @Result + ') 
Values 
(' 
select @Result = @Result + '@' + ColumnName + ', '
from (select replace(col.name, ' ', '_') ColumnName, column_id ColumnId from sys.columns col where object_id = object_id(@TableName)) t order by ColumnId

set @Result = @Result + ')'
set @Result = replace(@Result, ', )', ')')
print @Result