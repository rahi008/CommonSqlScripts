declare @TableName sysname = 'Orders'
declare @Result varchar(max) = 'Update ' + @TableName + ' set ' 

select @Result = @Result + ColumnName + '=@' + ColumnName + ', '
from (select replace(col.name, ' ', '_') ColumnName, column_id ColumnId from sys.columns col where object_id = object_id(@TableName)) t order by ColumnId

set @Result = @Result + 'Where ID=@'
set @Result = replace(@Result, ', Where', ' Where')

print @Result