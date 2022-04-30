<?php
include('../connect.php');
include('header.php');

// THE PROCESS OF CREATION [DATA FROM THE FORM BELOW]

if (isset($_POST['btnCreate'])) {
    if ($_POST['tfPass'] == $_POST['tfCPass']) {
        $check = $conn->prepare("Select qamEmail from qam where qamEmail=:email");
        $check->bindParam(':email', $_POST['tfEmail']);
        $check->execute();

        if ($check->rowCount() > 0) {
            echo "<script>window.alert('Email already exist')</script>";
        } else {
            $insertstmt = $conn->prepare("INSERT into qam(qamName,qamPhone,qamEmail,qamPassword,qamAddress,status)
                        values(?,?,?,?,?,?)");
            $insertstmt->bindParam(1, $_POST['tfName']);
            $insertstmt->bindParam(2, $_POST['tfPhone']);
            $insertstmt->bindParam(3, $_POST['tfEmail']);
            $hasedpass = password_hash($_POST['tfPass'], PASSWORD_DEFAULT);
            $insertstmt->bindParam(4, $hasedpass);
            $insertstmt->bindParam(5, $_POST['tfAddress']);
            $insertstmt->bindValue(6, TRUE);

            if ($insertstmt->execute()) {
                echo "<script>alert('A new account is successfully created!')</script>";
            } else {
                echo "" . $conn->errorInfo();
            }
        }
    } else {
        echo "<script>alert('Password and Confirm Password must be same!!')</script>";
        // echo "<script>window.location='stafflist.php'</script>";
    }
}

// THE PROCESS OF DELETING AN ACCOUNT TRIGGERED FROM TBODY BUTTON

if (isset($_GET["qamIdToDelete"])) {
    $qamIdToDelete = $_GET["qamIdToDelete"];
    echo "<script>
    if(confirm('Are you sure to delete this account?')==true){
    location='qam_acc_delete.php?qamIdToDelete=$qamIdToDelete';
    }else{
    location='qam_manage.php';
    }
    </script>";
}

// THE PROCESS OF ACCEPTING AN ACCOUNT TRIGGERED FROM TBODY BUTTON

if (isset($_GET["qamIdToAccept"])) {
    $updateStatusStmt = $conn->prepare("UPDATE qam set status=? where qamId=?");
    $updateStatusStmt->bindValue(1, TRUE);
    $updateStatusStmt->bindParam(2, $_GET['qamIdToAccept']);
    if ($updateStatusStmt->execute()) {
        echo "<script>location='qam_manage.php'</script>";
    } else {
        echo "<script>alert('Accept Error!')</script>";
    }
}
?>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>

<section class="page-title" style="background-image: url('../images/bg/hat.png') !important; background-size: cover; background-repeat: no-repeat;">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block text-center">
                    <span class="text-white">Administration (Admin Panel)</span>
                    <h1 class="text-capitalize mb-5 text-lg">QA Manager List</h1>

                    <!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Contact Us</a></li>
          </ul> -->
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<div class="container">
    <div class="row mb-4 d-flex justify-content-end">
        <button class="btn btn-primary" data-toggle="modal" data-target="#addNewQAM">Add New Account</button>
    </div>
    <div class="row">
        <div class="table-responsive">
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $selectstmt = $conn->prepare("SELECT * from qam");
                    $selectstmt->execute();
                    $datalist = $selectstmt->fetchAll(PDO::FETCH_ASSOC);
                    $count = 0;
                    foreach ($datalist as $data) {
                        $count++;
                        $qamId = $data['qamId'];
                        echo "<tr>";
                        echo "<td>$count</td>";
                        echo "<td>" . $data['qamName'] . "</td>";
                        echo "<td>" . $data['qamPhone'] . "</td>";
                        echo "<td>" . $data['qamEmail'] . "</td>";
                        echo "<td>........</td>";
                        echo "<td>" . $data['qamAddress'] . "</td>";
                        if ($data['status'] == 0) {
                            echo "<td style='color:green;'>Requested</td>";
                            echo "<td><a href='qam_manage.php?qamIdToAccept=$qamId' class='btn btn-success mb-2'>Accept</a><br>
                                        <a href='qam_manage.php?qamIdToDelete=$qamId' class='btn btn-danger'>Deny</a></td>";
                        } else {
                            echo "<td>Accepted</td>";
                            echo "<td><a href='qam_manage.php?qamIdToDelete=$qamId' class='actionlink'><i class='fas fa-trash'></i>&nbsp;&nbspDelete</a>
                                <br>
                                <a href='qam_acc_update_form.php?qamIdToUpdate=$qamId' class='actionlink'><i class='fas fa-edit'></i>&nbsp;&nbspEdit</a></td>";
                        }
                        echo "</tr>";
                    }
                    ?>

                </tbody>
                <tfoot>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<br><br>
<!--Version 4 Modal -->
<form method="post">
    <div class="modal fade" id="addNewQAM" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Create new QAM account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="label-name1">Enter Manager Name:</label>
                        <input type="text" name="tfName" class="form-control" id="label-name" aria-describedby="nameHelp" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="label-email">Enter Manager Phone:</label>
                        <input type="number" name="tfPhone" class="form-control" id="label-email" aria-describedby="emailHelp" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="label-password">Enter Manager Email:</label>
                        <input type="email" name="tfEmail" class="form-control" id="label-password" aria-describedby="passHelp" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="label-password">Create a new Password:</label>
                        <input type="password" name="tfPass" class="form-control" id="label-password" aria-describedby="passHelp" autocomplete="off" required>
                        <small id="passHelp" class="form-text text-muted">Must be 8 characters long</small>
                    </div>
                    <div class="form-group">
                        <label for="label-password">Enter Confirm Password:</label>
                        <input type="password" name="tfCPass" class="form-control" id="label-password" aria-describedby="passHelp" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Address (Optional)</label>
                        <textarea class="form-control" name="tfAddress" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary">Clear</button>
                    <button type="submit" name="btnCreate" class="btn btn-primary">Create Account</button>
                </div>
            </div>
        </div>
    </div>
</form>
<?php
include('footer.php');
?>