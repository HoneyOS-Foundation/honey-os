#[cfg(test)]
mod filetable_tests {
    use uuid::Uuid;

    use crate::filetable::{FileTable, PathResult, TableItem};

    #[test]
    fn test_filetable() {
        let mut file_table = FileTable::new();
        let file_id = file_table.create("test.txt", TableItem::File).unwrap();
        let dir_id = file_table.create("test", TableItem::Directory).unwrap();
        let file_id2 = file_table
            .create("test/test2.txt", TableItem::File)
            .unwrap();
        let dir_id2 = file_table
            .create("test/test2", TableItem::Directory)
            .unwrap();

        assert_eq!(
            file_table.get("test.txt", TableItem::File),
            Some(PathResult::File(file_id))
        );
        assert_eq!(
            file_table.get("test", TableItem::Directory),
            Some(PathResult::Directory(dir_id))
        );
        assert_eq!(
            file_table.get("test/test2.txt", TableItem::File),
            Some(PathResult::File(file_id2))
        );
        assert_eq!(
            file_table.get("test/test2", TableItem::Directory),
            Some(PathResult::Directory(dir_id2))
        );
    }

    #[test]
    fn fs_nesting_stress() {
        let mut file_table = FileTable::new();
        let mut dir_id = Uuid::nil();
        for i in 0..1000 {
            let dir_name = format!("dir{}", i);
            dir_id = file_table.create(&dir_name, TableItem::Directory).unwrap();
        }
        assert_eq!(
            file_table.get("dir999", TableItem::Directory),
            Some(PathResult::Directory(dir_id))
        );
    }
}
