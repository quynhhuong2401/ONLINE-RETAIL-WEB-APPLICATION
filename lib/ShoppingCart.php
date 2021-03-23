<?php
    class Product
    {
        var $id;
        var $num;
    }

    class ShoppingCart
    {
        var $listProduct;
        
        //khởi tạo danh sách sản phẩm
        public function _construct()
        {
            $this->listProduct = array();
        }

        //cập nhật sản phẩm
        public function update($id, $newNum)
        {
            //duyệt danh sách sản phẩm
            for($i = 0; $i < count($this->listProduct); $i++)
            {
                //nếu sản phẩm thứ i (sản phẩm đã có) trùng với id(sản phẩm chuẩn bị thêm vào)
                //thì cập nhật lại số lượng sản phẩm
                if($this->listProduct[$i]->id == $id)
                {
                    $this->listProduct[$i]->num = $newNum;
                }
            }
        }

        //Xóa 1 sản phẩm
        public function delete($id)
        {
            //duyệt danh sách sản phẩm 
            for($i = 0; $i < count($this->listProduct); $i++)
            {
                //nếu sản phẩm thứ i trùng với sản phẩm muốn xóa ($id) thì tiến hành xóa sản phẩm này
                if($this->listProduct[$i]->id == $id)
                    array_splice($this->listProduct, $i, 1); //xóa 1 sản phẩm tính từ vị trí thứ i
            }
        }

        public function add($id)
        {
            //nếu danh sách sản phẩm rỗng thì tạo mới sản phẩm và thêm sp vào danh sách
            if(count($this->listProduct == 0))
            {
                $p = new Product();
                $p->id = $id;
                $p->num = 1;

                $this->listProduct[] = $p;
            }
            else
            {
                //Đã có sản phẩm trong giỏ hàng rồi
				//cần kiểm tra sản phẩm đó đã tồn tại trong giỏ hàng chưa
				//nếu đã có rồi thì chỉ cần cập nhật số lượng lên 1
                //nếu chưa có thì thềm mới sản phẩm đó vào giỏ hàng
                
                for($i = 0; $i < count($this->listProduct); $i++)
                {
                    if($this->listProduct[$i]->id == $id)
                        break;
                }

                if($i == count($this->listProduct))
                {
                    //nếu đã duyệt hết danh sách sp mà không có sản phẩm trùng nào 
                    //thì thêm mới sản phẩm vào danh sách
                    $p = new Product();
                    $p->id = $id;
                    $p->num = 1;
                    
                    $this->listProduct[] = $p;
                }
                else
                {
                    $this->listProduct[$i]->num++;
                }
            }
        }
    }
?>